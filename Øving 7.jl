coins=[1000,500,100,20,5,1]
value= 1226

function can_use_greedy(A)

    for i in 1:length(A)-1

        if A[i] % A[i+1] != 0
            return false
        end
    end
    return true

end

function min_coins_greedy(C, v)
    currentValue = v
    count = 0
    for i in 1:length(C)
        count += fld(currentValue, C[i])
        currentValue = currentValue % C[i]
    end
    return count
end
print(min_coins_greedy(coins, value))
