function bisect_right(A, p, r, v)
    i = p
    if p < r
        q = floor(Int, (p+r)/2)
       if v < A[q]
            i = bisect_right(A, p, q, v)
       else
            i = bisect_right(A, q+1, r, v)
       end
    end
    return i
end

function bisect_left(A, p, r, v)
    i = p
    if p < r
       q = floor(Int, (p+r)/2)  # floor() er en innebygd funksjon som runder ned. ceil() runder opp.
       if v <= A[q]
           i = bisect_left(A, p, q, v)
       else
           i = bisect_left(A, q+1, r, v)
       end
    end
    return i
end

liste = [4, 7, 1, 2, 6, 9, 23, 9, 8, 1, 10]

function merging!(A, p, q, r)
    n1 = q-p+1
    n2 = r-q

    listA = []
    listB = []

    for i in 1:n1
        push!(listA, A[p+i-1])
    end
    for j in 1:n2
        push!(listB, A[q+j])
    end

    push!(listA, Inf)
    push!(listB, Inf)
    i = 1
    j = 1
    for k in p:r
        if listA[i] <= listB[j]
            A[k] = listA[i]
            i += 1
        else
            A[k] = listB[j]
            j += 1
        end
    end
end

function merge_sort!(A, p, r)
    if p < r
        q = floor(Int, (p+r)/2)
        merge_sort!(A,p,q)
        merge_sort!(A,q+1,r)
        merging!(A, p, q, r)
    end
end


function algdat_sort!(A)
    p = 1
    r = length(A)
    merge_sort!(A,p,r)

end


algdat_sort!(liste)

#println(liste)
liste2 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

function find_median(A, lower, upper)
    p = 1
    r = length(A)
    p2 = bisect_left(A, p, r+1,lower)
    r2 = bisect_right(A, p, r+1, upper)-1

    #println(p2, " ", r2)
    newList = A[p2:r2]
    println("Length of newList = ", length(newList))
    median = floor(Int, (1+length(newList))/2)

    if (length(newList) % 2 == 0)
        #median = (Int, (length(newList))/2)
        println("%2 median ", median)
        x = newList[median]
        y = newList[median+1]
        z = (x+y)/2
        #println("hello ", z)
        return z

    else
        #median = ceil(Int, (length(newList))/2)
        println("median oddetall " , median)
        return newList[median]

     end
end


#println(find_median(liste2, -100, 100))
println("svar 1, ", find_median([1,2,3], 1, 2))

#println("Svar min array ", find_median(liste2, 5,7))
#println("svar 2, ", find_median([10, 20, 30], -100, 100))


#println("svar 3, ", find_median([1, 5, 5, 7, 10, 10, 10], 5, 10))
