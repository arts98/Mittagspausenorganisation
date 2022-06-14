Class {
	#name : 'MPOMe5RegistrationView',
	#superclass : 'MPOMe5BaseView',
	#instVars : [
		'registerForm',
		'usernameTextField',
		'firstnameTextField',
		'lastnameTextField',
		'emailTextField',
		'passwordTextField',
		'repeatPasswordTextField'
	],
	#category : 'MPOFrontendApp'
}

{ #category : 'Initial-Events' }
MPOMe5RegistrationView >> beforeCreateComponents [
	"do nothing (dont show side menu)"
]

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
					addChildToBody: (usernameTextField := Me5TextField new
						leftOuterIcon: Me5I newFasAddressCard;
						text: 'Username';
						focus;
						yourself);
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

	"<^iOf TextField>"
	"Answer the emailTextField of the receiver"

	^emailTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> emailTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the emailTextField of the receiver"

	^emailTextField := aTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> firstnameTextField [

	"<^iOf TextField>"
	"Answer the firstnameTextField of the receiver"

	^firstnameTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> firstnameTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the firstnameTextField of the receiver"

	^firstnameTextField := aTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> lastnameTextField [

	"<^iOf TextField>"
	"Answer the lastnameTextField of the receiver"

	^lastnameTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> lastnameTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the lastnameTextField of the receiver"

	^lastnameTextField := aTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> passwordTextField [

	"<^iOf TextField>"
	"Answer the passwordTextField of the receiver"

	^passwordTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> passwordTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the passwordTextField of the receiver"

	^passwordTextField := aTextField
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
	(MPOPerson hasPersonForEmail: self emailTextField value)
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
			self repeatPasswordTextField dangerText: 'Passwort stimmt nicht ueberein'].
	theHasErrorBoolean
		ifFalse: [ | thePerson |
			thePerson := MPOPerson new
				username: self usernameTextField value;
				firstname: self firstnameTextField value;
				lastname: self lastnameTextField value;
				email: self emailTextField value;
				password: (MPOPerson hashPassword: self passwordTextField value);
				yourself.
			MPOPerson registerPerson: thePerson.
			self session person: thePerson.
			self replaceView: MPOMe5DashboardView new]
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> registerForm [

	"<^iOf Me5Form>"
	"Answer the registerForm of the receiver"

	^registerForm
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> registerForm: aMe5Form [

	"<aMe5Form: iOf Me5Form, ^self>"
	"Set the registerForm of the receiver"

	^registerForm := aMe5Form
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> repeatPasswordTextField [

	"<^iOf TextField>"
	"Answer the repeatPasswordTextField of the receiver"

	^repeatPasswordTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> repeatPasswordTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the repeatPasswordTextField of the receiver"

	^repeatPasswordTextField := aTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> usernameTextField [

	"<^iOf TextField>"
	"Answer the usernameTextField of the receiver"

	^usernameTextField
]

{ #category : 'Accessing' }
MPOMe5RegistrationView >> usernameTextField: aTextField [

	"<aTextField: iOf TextField, ^self>"
	"Set the usernameTextField of the receiver"

	^usernameTextField := aTextField
]
