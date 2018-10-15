function parse_string(sentence)
    A = []
    count = 1
    for i in 1:length(sentence)

        if string(sentence[i]) == " "

            push!(A, (sentence[count:i-1], count))
            count = i+1
        end

    end
    push!(A, (sentence[count:length(sentence)], count))
    return A
end


function build(list_of_words)
    Node() = nodemodule.Node(Dict(),[])
    root = Node()
    currentNode = root
    for element in list_of_words
        currentNode = root
            for letter in element[1]
                if !haskey(currentNode.children, letter)
                    currentNode.children[letter] = Node()
                    currentNode = get(currentNode.children, letter, nothing)
                else
                    currentNode = get(currentNode.children, letter, nothing)
                end
            end
            push!(currentNode.posi, element[2])
    end
    return root

end

module nodemodule

    struct Node
        children::Dict{Char,Node}
        posi::Array{Int}
    end

end

Node() = nodemodule.Node(Dict(),[])
n = Node()
x = nodemodule.Node(Dict('a' => n), [1,2,3,4])

testString = "ha ha mons har en hund med moms hun er en hunn"
println(build(parse_string(testString)))
#println(parse_string("en ei et hello"))
