{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}

module Hello (hello) where

import qualified GI.Gtk as Gtk
import Data.GI.Base
-- import Graphics.UI.Gtk

hello :: IO ()
hello = do
  Gtk.init Nothing

  win <- new Gtk.Window [ #title := "Introduction" ]
  on win #destroy Gtk.mainQuit
  #resize win 640 480

  box <- new Gtk.Box [ #orientation := Gtk.OrientationVertical]
  #add win box

  msg <- new Gtk.Label [#label := "Hello"]
  #add box msg

  textview <- new Gtk.TextView []
  #add box textview

  buffer <- new Gtk.textViewGetBuffer textview



--  textViewGetValue :: TextViewClass self => self -> IO String
--  textViewGetValue tv = do
--      buf <- textViewGetBuffer tv
--      start <- textBufferGetStartIter buf
--      end <- textBufferGetEndIter buf
--      value <- textBufferGetText buf start end True
--      return value

--  #add box tv



  btn <- new Gtk.Button [#label := "Click me!"]
  #add box btn
  on btn #clicked (set msg [#label := (show buffer)])

  #showAll win

  Gtk.main
