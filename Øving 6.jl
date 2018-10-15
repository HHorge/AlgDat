weights = [3  6  8 6 3;
           7  6  5 7 3;
           4  10 4 1 6;
           10 4  3 1 2;
           6  1  7 3 9]


function cumulative(weights)
    rows, cols = size(weights)
    result = [0 for i in 1:rows*cols]
    result = reshape(result, rows, cols)

    for i in 1:rows
        for j in 1:cols
            if i == 1
                result[i,j] = weights[i,j]

            elseif j < cols && j > 1
                #println(result[i-1,j])
                right = weights[i,j] + result[i-1,j+1]
                mid = weights[i,j] + result[i-1,j]
                left = weights[i,j] + result[i-1,j-1]

                max = right < mid ? right : mid
                result[i,j] = max < left ? max : left

            elseif j == 1
                right = weights[i,j] + result[i-1,j+1]
                mid = weights[i,j] + result[i-1,j]

                result[i,j] = right < mid ? right : mid

            elseif j == cols
                mid = weights[i,j] + result[i-1,j]
                left = weights[i,j] + result[i-1,j-1]

                result[i,j] = left < mid ? left : mid

            end
        end
    end

    return result


end

println(cumulative(weights))

#DEL 2
function back_track(path_weights)
    A = []
    min = Inf
    col = 0
    rows, cols = size(path_weights)
    for x in 1:cols
        if min > path_weights[rows, x]
            min = path_weights[rows,x]
            col = x
        end
    end
    push!(A, (rows, col))

    for i in rows:-1:2

        if col == 1
            mid = path_weights[i-1, col]
            right = path_weights[i-1, col+1]

            col = mid < right ? col : col+1



        elseif col == cols
            left = path_weights[i-1, col-1]
            mid = path_weights[i-1, col]

            col = mid < left ? col : col-1

        else

            left = path_weights[i-1, col-1]
            mid = path_weights[i-1, col]
            right = path_weights[i-1, col+1]

            if left < mid < right || left < right < mid
                col -= 1
            elseif mid < left < right || mid < right < left
                col = col
            else
                col += 1
            end

        end

        push!(A, (i-1, col))
    end

    return A

end

path_weights = [3  6  8  6  3;
                10 9  11 10 6;
                13 19 13 7  12;
                23 17 10 8  9;
                23 11 15 11 17]
println(back_track(path_weights))
