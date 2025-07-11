Class {
	#name : 'RSHorizontalTreeLayoutTest',
	#superclass : 'RSLayoutTest',
	#category : 'Roassal-Layouts-Tests',
	#package : 'Roassal-Layouts-Tests'
}

{ #category : 'utilities' }
RSHorizontalTreeLayoutTest >> apply [

	RSHorizontalTreeLayout on: canvas nodes
]

{ #category : 'tests' }
RSHorizontalTreeLayoutTest >> testBasic [
	RSHorizontalTreeLayout on: canvas nodes.
	self assert: (shapes collect: #position) asArray equals: {(7.5@23.5). (32.5@15.5). (32.5@35.5). (57.5@11.5). (57.5@23.5). (57.5@31.5). (57.5@39.5). (82.5@7.5). (82.5@15.5). (82.5@23.5)}
]

{ #category : 'tests' }
RSHorizontalTreeLayoutTest >> testBasicWithHorizontalGap [
	RSHorizontalTreeLayout new horizontalGap: 50; on: canvas nodes.
	self assert: (shapes collect: #position) asArray equals: {(7.5@23.5). (62.5@15.5). (62.5@35.5). (117.5@11.5). (117.5@23.5). (117.5@31.5). (117.5@39.5). (172.5@7.5). (172.5@15.5). (172.5@23.5)}
]

{ #category : 'tests' }
RSHorizontalTreeLayoutTest >> testBasicWithLeftGap [
	| withNoGap withGap |
	RSHorizontalTreeLayout new leftGap: 15; on: canvas nodes.
	withNoGap := {(7.5@23.5). (32.5@15.5). (32.5@35.5). (57.5@11.5). (57.5@23.5). (57.5@31.5). (57.5@39.5). (82.5@7.5). (82.5@15.5). (82.5@23.5)}.
	withGap := withNoGap collect: [ :p | p + (10 @ 0) ].
	self assert: (shapes collect: #position) asArray equals: withGap
]

{ #category : 'tests' }
RSHorizontalTreeLayoutTest >> testBasicWithTopGap [
	| withNoGap withGap |
	RSHorizontalTreeLayout new topGap: 15; on: canvas nodes.
	withNoGap := {(7.5@23.5). (32.5@15.5). (32.5@35.5). (57.5@11.5). (57.5@23.5). (57.5@31.5). (57.5@39.5). (82.5@7.5). (82.5@15.5). (82.5@23.5)}.
	withGap := withNoGap collect: [ :p | p + (0 @ 10) ].
	self assert: (shapes collect: #position) asArray equals: withGap
]

{ #category : 'tests' }
RSHorizontalTreeLayoutTest >> testBasicWithVerticalGap [
	RSHorizontalTreeLayout new verticalGap: 50; on: canvas nodes.
	self assert: (shapes collect: #position) asArray equals: {(7.5@117.5). (32.5@62.5). (32.5@200.0). (57.5@35.0). (57.5@117.5). (57.5@172.5). (57.5@227.5). (82.5@7.5). (82.5@62.5). (82.5@117.5)}
]

{ #category : 'tests' }
RSHorizontalTreeLayoutTest >> testCycles [
	| chars |
	canvas := RSLayoutNode new.
	chars := $a to: $e.
	shapes := RSLayoutNode models: chars forEach: [ :composite :char |
		| box label |
		label := RSLayoutNode text: char.
		box := RSLayoutNode new
			position: label position;
			extent: label extent + 10;
			yourself.

		composite
			draggable;
			add: box;
			add: label;
			yourself.
		].

	canvas addAll: shapes.
	RSLayoutLineBuilder new
		canvas: canvas;
		useAssociations:
			{$a -> $b.
			$a -> $e.
			$b -> $c.
			$c -> $d.
			$d -> $a}. "cycle"
	RSHorizontalTreeLayout on: shapes.
	self should: [RSHorizontalTreeLayout new validateCycles; on: shapes] raise: Error
]
