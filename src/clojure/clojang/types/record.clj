(ns clojang.types.record)

(defrecord Msg
  [msg
   msg-type
   recipient
   recipient-name
   recipient-pid
   sender-pid])

(defrecord Pid
  [node
   id
   serial
   creation])

(defrecord Port
  [node
   id
   creation])

(defrecord Port
  [node
   id
   ids
   creation])

