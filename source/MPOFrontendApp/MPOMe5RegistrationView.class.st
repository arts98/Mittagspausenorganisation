Class {
	#name : 'MPOMe5RegistrationView',
	#superclass : 'Me5BaseView',
	#instVars : [
		'registerForm',
		'firstnameTextField',
		'lastnameTextField',
		'emailTextField',
		'passwordTextField',
		'repeatPasswordTextField'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Events' }
MPOMe5RegistrationView >> cancelClicked [

	self replaceView: MPOMe5LoginView new
]

{ #category : 'Initial-Events' }
MPOMe5RegistrationView >> createComponents [

	self
		pageTitle: 'Registrierung';
		addChild: (Me5Container new
			maxWidth: 1000;
			addChild: (Me5Portlet new
				title: 'Registrierung';
				addChildToBody: (registerForm := Me5Form new
					addChildToBody: (firstnameTextField := Me5TextField new
						leftOuterIcon: Me5I newFasAddressCard;
						text: 'Vorname';
						focus;
						yourself);
					addChildToBody: (lastnameTextField := Me5TextField new
						leftOuterIcon: Me5I newFasAddressCard;
						text: 'Nachname';
						yourself);
					addChildToBody: (emailTextField := Me5TextField new
						leftOuterIcon: Me5I newFasEnvelope;
						text: 'Email';
						focus;
						yourself);
					addChildToBody: (passwordTextField := Me5PasswordField new
						leftOuterIcon: Me5I newFasLock;
						text: 'Passwort';
						yourself);
					addChildToBody: (repeatPasswordTextField := Me5PasswordField new
						leftOuterIcon: Me5I newFasLock;
						text: 'Passwort wiederholen';
						yourself);
					yourself);
				addChildToFoot: (Me5ButtonGroup newDivided
					addChild: (Me5Button newPrimary
						icon: Me5I newFasCheck;
						text: 'Registrieren';
						addClickEventSelector: #registerClicked;
						yourself);
					addChild: (Me5Button newWarning
						icon: Me5FrameworkIcon newCancel;
						text: 'Abbrechen';
						addClickEventSelector: #cancelClicked;
						yourself);
					yourself);
				yourself);
			yourself);
		yourself
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> emailTextField [

	"<^iOf Object>"
	"Answer the emailTextField of the receiver"

	^emailTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> emailTextField: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the emailTextField of the receiver"

	emailTextField := anObject
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> firstnameTextField [

	"<^iOf Object>"
	"Answer the firstnameTextField of the receiver"

	^firstnameTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> firstnameTextField: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the firstnameTextField of the receiver"

	firstnameTextField := anObject
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> lastnameTextField [

	"<^iOf Object>"
	"Answer the lastnameTextField of the receiver"

	^lastnameTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> lastnameTextField: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the lastnameTextField of the receiver"

	lastnameTextField := anObject
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> passwordTextField [

	"<^iOf Object>"
	"Answer the passwordTextField of the receiver"

	^passwordTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> passwordTextField: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the passwordTextField of the receiver"

	passwordTextField := anObject
]

{ #category : 'Events' }
MPOMe5RegistrationView >> registerClicked [

	| theHasErrorBoolean |
	theHasErrorBoolean := false.
	self registerForm clearDangerTexts.
	self emailTextField hasValue
		ifFalse: [
			theHasErrorBoolean := true.
			self emailTextField dangerText: 'Bitte gib eine Email ein'].
	(true "MPOMe5Person hasPersonForEmail: self emailTextField value")
		ifTrue: [
			theHasErrorBoolean := true.
			self emailTextField dangerText: 'Email wurde bereits verwendet'].
	self passwordTextField hasValue
		ifFalse: [
			theHasErrorBoolean := true.
			self passwordTextField dangerText: 'Bitte gib ein Passwort ein'].
	self repeatPasswordTextField hasValue
		ifFalse: [
			theHasErrorBoolean := true.
			self repeatPasswordTextField dangerText: 'Bitte gib ein Passwort ein'].
	(theHasErrorBoolean not and: [self passwordTextField value ~= self repeatPasswordTextField value])
		ifTrue: [
			theHasErrorBoolean := true.
			self repeatPasswordTextField dangerText: 'Passwort stimmt nicht ÃƒÂ¼berein'].
	theHasErrorBoolean
		ifFalse: [ | thePerson |
			"thePerson := MPOMe5Person new
				email: self emailTextField value;
				password: (MPOMe5Person hashPassword: self passwordTextField value);
				yourself.
			MPOMe5Person registerPerson: thePerson.
			self session person: thePerson.
			self replaceView: Me5MetronicExampleLoginTutorialStartView new"]
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> registerForm [

	"<^iOf Object>"
	"Answer the registerForm of the receiver"

	^registerForm
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> registerForm: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the registerForm of the receiver"

	registerForm := anObject
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> repeatPasswordTextField [

	"<^iOf Object>"
	"Answer the repeatPasswordTextField of the receiver"

	^repeatPasswordTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> repeatPasswordTextField: anObject [

	"<anObject: iOf Object, ^self>"
	"Set the repeatPasswordTextField of the receiver"

	repeatPasswordTextField := anObject
]
