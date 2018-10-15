
function traversemax(record)
    maxnum = record.value
        while record.next != nothing
            if maxnum < record.next.value
                maxnum = record.next.value

            end
            record = record.next
    end
    return maxnum
end
