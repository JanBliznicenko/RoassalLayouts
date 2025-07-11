Class {
	#name : 'RSVerticalGridLayoutTest',
	#superclass : 'RSLayoutTest',
	#category : 'Roassal-Layouts-Tests',
	#package : 'Roassal-Layouts-Tests'
}

{ #category : 'utilities' }
RSVerticalGridLayoutTest >> apply [

	RSVerticalCellLayout on: canvas nodes
]

{ #category : 'tests' }
RSVerticalGridLayoutTest >> testBasic [

	RSVerticalCellLayout on: canvas nodes.
	self assert: (shapes collect: #position) asArray equals: {(2.5@2.5). (2.5@12.5). (2.5@22.5). (2.5@32.5). (12.5@2.5). (12.5@12.5). (12.5@22.5). (12.5@32.5). (22.5@2.5). (22.5@12.5)}
]
