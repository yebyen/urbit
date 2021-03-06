::
::::  /hoon/sole/sur
  !:
|%
++  sole-action                                         ::  sole to app
  $%  ::  [%abo ~]                                      ::  reset interaction
      [%det sole-change]                                ::  command line edit
      [%ret ~]                                          ::  submit and clear
  ==                                                    :: 
++  sole-buffer  (list ,@c)                             ::  command state
++  sole-change                                         ::  network change
  $:  ler=sole-clock                                    ::  destination clock
      haw=@uvH                                          ::  source hash
      ted=sole-edit                                     ::  state change
  ==                                                    ::
++  sole-dialog                                         ::  standard dialog
  |*  out=$+(* *)                                       ::  output structure
  $+(sole-input (sole-result out))                      ::  output function
::                                                      ::
++  sole-result                                         ::  conditional result
  |*  out=$+(* *)                                       ::  output structure
  $|(@ud (sole-product out))                            ::  error position
::                                                      ::
++  sole-product                                        ::  success result
  |*  out=$+(* *)                                       ::
  %+  pair  (list tank)                                 ::  
  %+  each  (unit out)                                  ::  ~ is abort
  (pair sole-prompt (sole-dialog out))                  ::  ask and continue
::                                                      ::
++  sole-so                                             ::  construct result
  |*  pro=*                                             ::
  [p=*(list tank) q=[%& p=[~ u=pro]]]                   ::
::                                                      ::
++  sole-yo                                             ::  add output tank
  |*  [tan=tank res=(sole-result)]                      ::
  ?@  res  res                                          ::
  [p=[i=tan t=p.res] q=q.res]                           ::
::                                                      ::
++  sole-lo                                             ::  construct prompt
  |*  [pom=sole-prompt mor=(sole-dialog)]               ::
  [p=*(list tank) q=[%| p=pom q=mor]]                   ::
::                                                      ::
++  sole-no                                             ::  empty result
  [p=*(list tank) q=~]                                  ::
::                                                      ::
++  sole-go                                             ::  parse by rule
  |*  [sef=_rule fun=$+(* *)]                           ::
  |=  txt=sole-input                                    ::
  =+  vex=(sef [0 0] txt)                               ::
  ?:  |(!=((lent txt) q.p.vex) ?=(~ q.vex))             ::
    q.p.vex                                             ::
  (fun p.u.q.vex)                                       ::
::                                                      ::
++  sole-clock  ,[own=@ud his=@ud]                      ::  vector clock
++  sole-edit                                           ::  shared state change
  $%  [%del p=@ud]                                      ::  delete one at
      [%ins p=@ud q=@c]                                 ::  insert at
      [%mor p=(list sole-edit)]                         ::  combination
      [%nop ~]                                          ::  no-op
      [%set p=sole-buffer]                              ::  discontinuity
  ==                                                    ::
++  sole-effect                                         ::  app to sole
  $%  [%bel ~]                                          ::  beep
      [%blk p=@ud q=@c]                                 ::  blink/match char at
      [%clr ~]                                          ::  clear screen
      [%det sole-change]                                ::  edit command
      [%err p=@ud]                                      ::  error point
      [%mor p=(list sole-effect)]                       ::  multiple effects
      [%nex ~]                                          ::  save, clear command
      [%pro sole-prompt]                                ::  set prompt
      [%sag p=path q=*]                                 ::  save to jamfile
      [%sav p=path q=@]                                 ::  save to file
      [%tan p=(list tank)]                              ::  classic tank
  ::  [%taq p=tanq]                                     ::  modern tank
      [%txt p=tape]                                     ::  text line
  ==                                                    ::
++  sole-command                                        ::  command state
  $:  pos=@ud                                           ::  cursor position
      say=sole-share                                    ::  cursor 
  ==                                                    ::
++  sole-prompt                                         ::  prompt definition
  $:  vis=?                                             ::  command visible
      tag=term                                          ::  history mode
      cad=tape                                          ::  caption
  ==                                                    ::
++  sole-input  tape                                    ::  prompt input
++  sole-share                                          ::  symmetric state
  $:  ven=sole-clock                                    ::  our vector clock
      leg=(list sole-edit)                              ::  unmerged edits
      buf=sole-buffer                                   ::  sole state
  ==                                                    ::
--
