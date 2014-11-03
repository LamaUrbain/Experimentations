(* pedro_m *)
(** DIAL signature for implementing dial between an application and a database *)
module type DIAL =
  sig
    
    (** Store the request for easy access call, using by name *)
    val prepare_requests : (string * string) list list -> unit

    (** Clean all stored requests *)
    val clean_request : ('a * string) list list -> unit

    (** Execute specific request by name with parameters *)
    val execute_request : (string * string option list) -> string list

    (** Draw a resulting row *)
    val print_row : string option list -> unit

    (** Close the access to the database *)
    val close : unit -> unit
			  
  end

(** Dial is a module implementing DIAL signature using PGOcaml functions *)
module Dial : DIAL 
