(*
 *  This file is part of JavaLib
 *  Copyright (c)2007 Université de Rennes 1
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *)

(** Access to the constant pool. *)

(** You should not need this module for normal classfiles, as the
    parsing/unparsing function take care of the constant pool. *)

(** Low level access to the constant pool. This is usefull for adding
    a user-defined attribute that refers to the constant pool. *)
val constant_to_int : JClass.constant DynArray.t -> JClass.constant -> int

(**/**)

type error_msg =
    Invalid_data
  | Invalid_constant of int
  | Invalid_access_flags of int
  | Custom of string

exception Error of string

val error : string -> 'a

val get_constant : JClass.constant array -> int -> JClass.constant

val get_constant_value : JClass.constant array -> int -> JClass.constant_value

val get_object_type : JClass.constant array -> int -> JClass.object_type
val get_class : JClass.constant array -> int -> JClass.class_name

val get_string : JClass.constant array -> IO.input -> string

val get_field : JClass.constant array -> int ->
  JClass.class_name * string * JClass.field_signature

val get_method : JClass.constant array -> int ->
  JClass.object_type * string * JClass.method_signature

val get_interface_method : JClass.constant array -> int ->
  JClass.class_name * string * JClass.method_signature

(* This should go somewhere else. *)

val write_ui8 : 'a IO.output -> int -> unit
val write_i8 : 'a IO.output -> int -> unit
val write_constant :
  'a IO.output -> JClass.constant DynArray.t -> JClass.constant -> unit
val write_string_with_length :
  ('a IO.output -> int -> 'b) -> 'a IO.output -> string -> unit
val write_with_length :
  ('a IO.output -> int -> 'b) ->
  'a IO.output -> (string IO.output -> 'c) -> unit
val write_with_size :
  ('a -> int -> 'b) -> 'a -> ('c -> unit) -> 'c list -> unit
