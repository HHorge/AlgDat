
# function charToNum(str, pos)
#     return Int(str[pos])-96
# end
#
function findMax(A)
    max = 0
    for x in A
        if length(x) > max
            max = length(x)
        end
    end
    return max
end

function counting_sort_length(A)
    k = findMax(A)
    C = [0 for x in 1:k+1]
    B = ["" for i in 1:length(A)]
    
    for j in 1:length(A)
        C[length(A[j])+1] += 1
        #C[A[j]] = C[A[j]]+1
    end
    for i in 2:(k+1)
        C[i] = C[i] + C[i-1]
    end
    for j in length(A):-1:1
        B[C[length(A[j])+1]] = A[j]
        C[length(A[j])+1] -= 1

        #B[C[A[j]]] = A[j]
        #C[A[j]] = C[A[j]]-1
    end
        println("A er ", A)
        println("B er ", B)
        println("C er ", C)
        println("\n")
        return B
end


numbers = [1,4,1,2,7,5,2]

letters = ["bbbb", "aa", "aaaa", "ccc", ""]

println(counting_sort_length(letters))


#charToNum(letters, 2)
