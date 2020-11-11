{-# LANGUAGE OverloadedStrings, OverloadedLabels #-}

module Hello (hello) where

import qualified GI.Gtk as Gtk
import Data.GI.Base
-- import Graphics.UI.Gtk
import Graphics.UI.Gtk.Multiline.TextView
import Graphics.UI.Gtk.Multiline.TextBuffer
import Graphics.UI.Gtk.Multiline.TextIter




--textViewGetValue :: TextViewClass self => self -> IO String
--textViewGetValue tv = do
--    buf <- textViewGetBuffer tv
--    start <- textBufferGetStartIter buf
--    end <- textBufferGetEndIter buf
--    value <- textBufferGetText buf start end True
--    return value

--compileText :: SourceView -> IO ()
--compileText tview = do
--    txtBuff <- textViewGetBuffer tview
--    startIt <- textBufferGetStartIter txtBuff
--    endIt <- textBufferGetEndIter txtBuff
--    compTime <- getClockTime
--    srcString <- textBufferGetText txtBuff startIt endIt False



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

  buffer <- Gtk.textViewGetBuffer textview
--  buffer2 <- textBufferGetText buffer
  let name = Gtk.textBufferGetText (Gtk.textViewGetBuffer textview) start end True

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
  on btn #clicked (set msg [#label := (name)])

  #showAll win

  Gtk.main
