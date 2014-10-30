(* pedro_m *)

module type DIAL =
  sig

    val prepare_requests : (string * string) list list -> unit
    val clean_request : ('a * string) list list -> unit
    val execute_request : (string * string option list) -> string list
    val print_row : string option list -> unit
    val close : unit -> unit
			  
  end

module Dial : DIAL 
