(* pedro_m *)
module type DIAL =
  sig
    val prepare_requests : (string * string) list list -> unit
    val clean_request : ('a * string) list list -> unit
    val execute_request : (string * string option list) -> string list
    val print_row : string option list -> unit
    val close : unit -> unit
  end

module Dial : DIAL =
  struct

    let dbh = PGOCaml.connect ~database:"DB_NAME" ()
			      
    let rec print_row = function
      | Some o :: next -> print_string (o ^ " "); print_row next
      | None :: next -> print_string ("-" ^ " "); print_row next
      | _ -> print_endline ""
			   
    let prepare_requests = fun rql -> List.iter (fun l -> List.iter (fun (req, name) -> PGOCaml.prepare dbh ~query:req ~name:name ()) l) rql

    let clean_request = fun rql -> List.iter (fun l -> List.iter (fun ( _, name) -> PGOCaml.close_statement dbh ~name:name ()) l) rql

    let execute_request = fun (name, params) ->
      let r = PGOCaml.execute dbh ~name:name ~params:params () in
      List.iter print_row r;
      List.map (function | Some o :: next -> o | _ -> "") r
								
    let close () =
      ignore (PGOCaml.close dbh)
    
  end
