"
Based on roassal
https://github.com/ObjectProfile/Roassal3
"
Class {
	#name : 'BaselineOfRoassalLayouts',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfRoassalLayouts',
	#package : 'BaselineOfRoassalLayouts'
}

{ #category : 'baselines' }
BaselineOfRoassalLayouts >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec 
			package: 'Roassal-Layouts';
			package: 'Roassal-Layouts-Tests';
			package: 'Roassal-Layouts-Util'.
		spec group: 'default' with: #(
			'Roassal-Layouts'
			'Roassal-Layouts-Util'
			'Roassal-Layouts-Tests')
	].
]
