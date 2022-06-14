Class {
	#name : 'MPOMe5LoginView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'emailTextField',
		'passwordTextField'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Initial-Events' }
MPOMe5LoginView >> beforeCreateComponents [
	"dont show side menu"
	self session person: nil.
]

{ #category : 'Initial-Events' }
MPOMe5LoginView >> createComponents [

	self
		pageTitle: 'Login';
		addChild: (Me5Container new
			maxWidth: 1000;
			addChild: (Me5Portlet new
				title: 'Login';
				addChildToBody: (Me5Form new
					addChildToBody: (emailTextField := Me5TextField new
						leftOuterIcon: Me5I newFasEnvelope;
						text: 'Email';
						focus;
						addEnterKeypressEventSelector: #logInClicked;
						yourself);
					addChildToBody: (passwordTextField := Me5PasswordField new
						leftOuterIcon: Me5I newFasLock;
						text: 'Passwort';
						addEnterKeypressEventSelector: #logInClicked;
						yourself);
					yourself);
				addChildToFoot: (Me5ButtonGroup newDivided
					addChild: (Me5Button newPrimary
						icon: Me5I newFasSignInAlt;
						text: 'Log in';
						addClickEventSelector: #logInClicked;
						yourself);
					addChild: (Me5Button newInfo
						icon: Me5I newFasAddressCard;
						text: 'Registrieren';
						addClickEventSelector: #registrationClicked;
						yourself);
					yourself);
				yourself);
			yourself);
		yourself
]

{ #category : 'Accessing' }
MPOMe5LoginView >> emailTextField [

	"<^iOf TextField>"
	"Answer the emailTextField of the receiver"

	^emailTextField
]

{ #category : 'Accessing' }
MPOMe5LoginView >> emailTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the emailTextField of the receiver"

	^emailTextField := aTextField
]

{ #category : 'Events' }
MPOMe5LoginView >> logInClicked [

	| thePerson |
	thePerson := MPOPerson logInEmail: self emailTextField value password: self passwordTextField value.
	thePerson isNil
		ifTrue: [self emailTextField dangerText: 'Falsche Email oder falsches Passwort.']
		ifFalse: [
			self session person: thePerson.
			self replaceView: MPOMe5DashboardView new]
]

{ #category : 'Accessing' }
MPOMe5LoginView >> passwordTextField [

	"<^iOf TextField>"
	"Answer the passwordTextField of the receiver"

	^passwordTextField
]

{ #category : 'Accessing' }
MPOMe5LoginView >> passwordTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the passwordTextField of the receiver"

	^passwordTextField := aTextField
]

{ #category : 'Events' }
MPOMe5LoginView >> registrationClicked [

	self replaceView: MPOMe5RegistrationView new
]
