let square x = x * x


let sumOfSquares100 =
    List.sum (List.map square [1..100])

let sumOfSquares100Pipe =
    [1..100] |> List.map square |> List.sum

let sumOfSquares100WithFun =
    [1..100] |> List.map (fun x -> x * x) |> List.sum