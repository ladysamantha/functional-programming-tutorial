open System
open System.IO
open System.Text.RegularExpressions

[<EntryPoint>]
let main _ =
  let text = File.ReadAllText("leaves.txt")
              |> fun text -> text.ToLower()
  printfn "#RANK: WORD -> COUNT" 
  Regex.Split(text, "[\s.,\/:\n]+")
    |> Seq.groupBy (id)
    |> Seq.map (fun (word, instances) -> (word, Seq.length instances))
    |> Seq.sortBy (fun (_, count) -> -count)
    |> Seq.take 10
    |> Seq.iteri (fun i (w, count) -> printfn "%d -> %s: %A" (i+1) w count) 
  0
