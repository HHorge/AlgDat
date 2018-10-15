i = 6
println(i)

lst = [3,5,7,8,2]


function insertionsort!(A)
    for j in 2:length(A)
        key = A[j]
        i = j-1
        while i > 0 && A[i] > key
            A[i+1] = A[i]
            i -= 1

        A[i+1] = key
        end
    end
    prinln(A)
end


insertionsort!(lst)
