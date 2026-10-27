function shallow_copy(t) 
	local t2 = {}
	for k,v in pairs(t) do
		t2[k] = v
	end
	return t2
end

-- compares sequence A > sequence B
-- returns dict ["type", "val"]
function diff(seq_A, seq_B)
	local N = #seq_A
	local M = #seq_B
	local MAX = N+M

	local offset = MAX+1 -- 1 for 1 indexed indices

	local V = {}
	V[1+offset] = 0

	local V_History = {}
	local final_D = nil
	for D=0, MAX do
		for K = -D, D, 2 do
			local K_Idx = K + offset
			
			if K == -D or (K ~= D and V[K_Idx-1] < V[K_Idx+1]) then
				x = (V[K_Idx+1] or 0)
			else
				x = (V[K_Idx-1]+1 or 0)
			end

			local y = x - K

			while x < N and y < M and seq_A[x+1] == seq_B[y+1] do
				x = x + 1
				y = y + 1
			end

			V[K_Idx] = x

			if x >= N and y >= M then 
				V_History[#V_History+1] = shallow_copy(V)
				final_D = D
				return backtrack_diff(seq_A, seq_B, final_D, V_History)
			end
		end

		V_History[#V_History+1] = shallow_copy(V)
	end
end

-- takes: final_D (shortest edit distance), V_History
--
function backtrack_diff(seq_A, seq_B, final_D, V_History)
	local N, M = #seq_A, #seq_B
	local MAX = N+M

	local script = {}

	local x = N 
	local y = M

	local offset = MAX + 1

	for D=final_D, 1, -1 do
		local K = x-y
		local K_Idx = K+offset
		local prev_V = V_History[D]
		
		local prev_K
		if K == -D or (K~=D and (prev_V[K_Idx-1] or -1) < (prev_V[K_Idx+1] or -1)) then
			prev_K = K+1
		else
			prev_K = K-1
		end
		
		local prev_x = prev_V[prev_K + offset]
		local prev_y = prev_x - prev_K

		while x > prev_x and y > prev_y do
			table.insert(script, 1, { type = "keep", val=seq_A[x] })
			x = x - 1
			y = y - 1
		end

		if x > prev_x then
			table.insert(script, 1, { type = "delete", val=seq_A[x] })
			x = x - 1
		elseif y > prev_y then
			table.insert(script, 1, { type = "insert", val=seq_B[y] })
			y = y - 1
		end
	end
	while x > 0 and y > 0 do
		table.insert(script, 1, { type = "keep", val = seq_A[x] })
		x, y = x - 1, y - 1
	end

	return script
end

-- [usage]
-- script = diff(seq_1, seq_2)
--
--for _, v in pairs(script) do
--	 print(v["type"],v["val"])
--end


