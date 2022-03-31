Author fullName: 'GlamorousToolkit'.

EpMonitor current disable.
[
    Metacello new
    onWarningLog;
    baseline: 'GtDemoApp';
    onConflictUseIncoming;
    repository: 'github://feenkcom/gtoolkit-demo-app/src';
    load.
] ensure: [ EpMonitor current enable ].

GtImageSetup cleanUpImageAfterLoad.
World closeAllWindowsDiscardingChanges.

Smalltalk snapshot: true andQuit: false.
