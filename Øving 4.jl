
function charToNum(str, pos)
    return Int(str[pos])-96
end

function counting_sort_letters(A, pos)
    k = 26
    C = [0 for x in 1:k+1]
    B = ["" for i in 1:length(A)]
    for i in 1:k+1
        C[i] = 0
    end

    for j in 1:length(A)
        C[charToNum(A[j], pos)] += 1
        #C[A[j]] = C[A[j]]+1
    end
    for i in 2:k+1
        C[i] = C[i] + C[i-1]
    end
    for j in length(A):-1:1
        B[C[charToNum(A[j], pos)]] = A[j]
        C[charToNum(A[j], pos)] -= 1

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
letters = ["ccc", "cba", "ca", "ab", "abc"]
println(counting_sort_letters(letters, 2))



#charToNum(letters, 2)
