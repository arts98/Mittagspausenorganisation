Class {
	#name : 'MPOMe5CommentCounterSession',
	#superclass : 'Bs4Session',
	#instVars : [
		'counter'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Not categorized' }
MPOMe5CommentCounterSession >> counter [

	^counter
]

{ #category : 'Not categorized' }
MPOMe5CommentCounterSession >> counter: aNumber [

	counter := aNumber
]

{ #category : 'Not categorized' }
MPOMe5CommentCounterSession >> initialize [

super initialize.

counter:=0
]
