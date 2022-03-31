| version |

Author fullName: 'GlamorousToolkit'.

version := Smalltalk os environment
	           at: 'GT_DEMO_VERSION'
	           ifPresent: [ :aVersion | aVersion ]
	           ifAbsent: [ self error: 'Application version is not defined' ].

EpMonitor current disable.
[
    Metacello new
    onWarningLog;
    baseline: 'GtDemoApp';
    onConflictUseIncoming;
    repository: 'github://feenkcom/gtoolkit-demo-app:' , version , '/src';
    load.
] ensure: [ EpMonitor current enable ].

GtImageSetup cleanUpImageAfterLoad.
World closeAllWindowsDiscardingChanges.

Smalltalk snapshot: true andQuit: false.
