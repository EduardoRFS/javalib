(*
 *  This file is part of JavaLib
 *  Copyright (c)2004 Nicolas Cannasse
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

(** Low level (un)parsing of bytecode instructions. *)

(** Parse a sequence of instructions of given size (in bytes) and
    returns an array of instructions. *)
val parse_code : IO.input -> JClass.constant array -> int -> JOpCode.opcode array

(** Unparse a sequence of instructions. Provided constants are kept unchanged.
    Missing constant are added at the end of the constant pool if
    needed. *)
val unparse_code :
  'a IO.output -> JClass.constant DynArray.t -> JOpCode.opcode array -> unit

(**/**)

exception Invalid_opcode of int

(* For testing. *)

val parse_full_opcode :
  IO.input -> (unit -> int) -> JClass.constant array -> JOpCode.opcode
val unparse_instruction :
  'a IO.output -> JClass.constant DynArray.t -> (unit -> int) -> JOpCode.opcode -> unit
