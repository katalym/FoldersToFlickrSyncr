{-----------------------Memory Manager Sharing Options------------------------}

{Allow sharing of the memory manager between a main application and DLLs that
 were also compiled with FastMM. This allows you to pass dynamic arrays and
 long strings to DLL functions provided both are compiled to use FastMM.
 Sharing will only work if the library that is supposed to share the memory
 manager was compiled with the "FastMM_AttemptToUseSharedMM" option set. Note that if
 the main application is single threaded and the DLL is multi-threaded that you
 have to set the IsMultiThread variable in the main application to true or it
 will crash when a thread contention occurs. Note that statically linked DLL
 files are initialized before the main application, so the main application may
 well end up sharing a statically loaded DLL's memory manager and not the other
 way around. }
{$define FastMM_ShareMM}

  {Allow sharing of the memory manager by a DLL with other DLLs (or the main
   application if this is a statically loaded DLL) that were also compiled with
   FastMM. Set this option with care in dynamically loaded DLLs, because if the
   DLL that is sharing its MM is unloaded and any other DLL is still sharing
   the MM then the application will crash. This setting is only relevant for
   DLL libraries and requires FastMM_ShareMM to also be set to have any effect.
   Sharing will only work if the library that is supposed to share the memory
   manager was compiled with the "FastMM_AttemptToUseSharedMM" option set. Note that
   if DLLs are statically linked then they will be initialized before the main
   application and then the DLL will in fact share its MM with the main
   application. This option has no effect unless FastMM_ShareMM is also set.}
  {.$define FastMM_ShareMMIfLibrary}

{Define this to attempt to share the MM of the main application or other loaded
 DLLs in the same process that were compiled with FastMM_ShareMM set. When sharing a
 memory manager, memory leaks caused by the sharer will not be freed
 automatically. Take into account that statically linked DLLs are initialized
 before the main application, so set the sharing options accordingly.}
{$define FastMM_AttemptToUseSharedMM}

{--------------------------------Option Grouping------------------------------}

{Combines the FastMM_FullDebugMode, FastMM_DebugLibraryDynamicLoading. Consequently FastMM will only be installed
 (In FastMM_FullDebugMode) when the FastMM_FullDebugMode.dll file is available. This
 is useful when the same executable will be distributed for both debugging as
 well as deployment.}
{.$define FastMM_FullDebugModeWhenDLLAvailable}

{.$define FastMM_DebugLibraryStaticDependency}
{.$define FastMM_DisableAutomaticInstall}


{Group the options you use for release and debug versions below}
{$ifdef Release}
  {Specify the options you use for release versions below}
  {$undef FastMM_FullDebugMode}
  {$define FastMM_ClearLogFileOnStartup}
  {$define FastMM_EnableMemoryLeakReporting}
{$else}
  {Specify the options you use for debugging below}
  {$define FastMM_FullDebugMode}
  {$define FastMM_EnableMemoryLeakReporting}
  {$define FastMM_ClearLogFileOnStartup}
{$endif}