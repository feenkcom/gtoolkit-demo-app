| version |

Author fullName: 'GlamorousToolkit'.

version := Smalltalk os environment
	           at: 'GT_DEMO_VERSION'
	           ifPresent: [ :aVersion | aVersion ]
	           ifAbsent: [ 'main' ].

EpMonitor current disable.
NonInteractiveTranscript stdout install.
[
    Metacello new
    onWarningLog;
    baseline: 'GtDemoApp';
    onConflictUseIncoming;
    repository: 'github://feenkcom/gtoolkit-demo-app:' , version , '/src';
    load.
] ensure: [ 
    GtTranscript installDefault.
    EpMonitor current enable ].

GtImageSetup cleanUpImageAfterLoad.
World closeAllWindowsDiscardingChanges.

Smalltalk snapshot: true andQuit: false.
