; USEFUL WEBSITES DURING ADJUDICATION:
	; TAL:
		:*:opental::
		Run, chrome.exe http://eur.p.state.sbu/sites/moscow/Consular/Internal/SiteAssets/NIV%20quick%20text%20%20guidance/Home/2015TAL.pdf
		Return
	; CCD:
		:*:openccd::
		run, chrome.exe https://cadata.ca.state.gov/ {enter}
		return
	; Moscow Consular Internal Website:
		:*:openinternal::
		Run, chrome.exe http://eur.p.state.sbu/sites/moscow/Consular/Internal/NIV%20quick%20text%20%20guidance/Home.aspx
		Return
	; Moscow NIV Dashboard:
		:*:opendash::
		Run, chrome.exe http://nivdashboard.state.gov/moscow/
		Return
	; Russia Reciprocity Table:
		:*:openrecip::
		Run, chrome.exe http://intranet.ca.state.gov/visas/reciprocity/country/8941.aspx
		Return
	; Belarus Reciprocity Table:
		:*:openbys::
		Run, chrome.exe http://intranet.ca.state.gov/visas/reciprocity/sbucounty/28025.aspx
		Return
	
	; Google Search Engine:
		:*:openggl::
		Run, chrome.exe https://www.google.com/
			sleep, 1000
			Loop
				{
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Screen
				ImageSearch, FoundGoogleX, FoundGoogleY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\I'M_FEELING_LUCKY.bmp
				if ErrorLevel=0
					break
				}
			CoordMode, Mouse, Screen
			MouseMove, %FoundGoogleX%, %FoundGoogleY%, 0
			MouseMove, 0, -50, 0, R
			click 1
			Return

	; Search seleced text in Google:
		^g::
			send ^c
			sleep, 10
			Run, chrome.exe www.google.com/
			Loop
				{
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Screen
				ImageSearch, FoundGoogleX, FoundGoogleY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\I'M_FEELING_LUCKY.bmp
				sleep 100
				if ErrorLevel=0
					break
				}
			CoordMode, Mouse, Screen
			MouseMove, %FoundGoogleX%, %FoundGoogleY%, 0
			MouseMove, 0, -50, 0, R
			click 1
			sleep 50
			send ^v {enter}
			return
	; Google Search Engine:
		:*:openyandex::
		Run, chrome.exe https://www.yandex.com/
			sleep, 1000
			Loop
				{
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Screen
				ImageSearch, FoundYandexX, FoundYandexY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\YANDEX.bmp
				if ErrorLevel=0
					break
				}
			CoordMode, Mouse, Screen
			mousemove, %FoundYandexX%, %FoundYandexY%, 0
			mousemove, 250, 30, 0, R
			click 1
			Return
	; Search selected text in Yandex:
		^h::
			send ^c
			sleep, 10
			Run, chrome.exe www.yandex.com/
			Loop
				{
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Screen
				ImageSearch, FoundYandexX, FoundYandexY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\YANDEX.bmp
				sleep 100
				if ErrorLevel=0
					break
				}
			CoordMode, Mouse, Screen
			mousemove %FoundYandexX%, %FoundYandexY%, 0
			mousemove 250, 30, 0, R
			click 1
			sleep 50
			send ^v {enter}
			return		

	; Open Google with Belarusian Ruble Converter:
		:*:openbyrex::
		run, chrome.exe https://www.google.com/search?q=convert+1+USD+to+BYR
		Return


;BIOMETRICS:
	;All scripts and hotkeys are designated so that the left hand can remain on the keyboard while the right hand holds the barcode scanner.:
	;SCRIPTS:
		; From any screen, open applicant select screen by pressing 1-1-1:
		:*:11ee::
			#ifwinactive, ahk_class FNWND3105
				send ^a
				return
			#ifwinactive
		; After scanning barcode, go directly into capturing fingerprints by pressing 2-2-2:
		:*:22ee::
			#ifwinactive, ahk_class FNWND3105
				send !s
				sleep 500
				send !g
				sleep 250
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				sleep 250
				CoordMode, Pixel, Screen
				ImageSearch, FoundX, FoundY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\CAPTURE_FINGER.bmp
				sleep 250
				if ErrorLevel = 2
				{
					MsgBox, Could not conduct the search.  Error type 2.
					return
				}
				if ErrorLevel = 1
				{
					MsgBox, Could not find the "capture" button.  Error type 1.
					return
				}
				if ErrorLevel = 0
				{
					CoordMode, Mouse, Screen
					MouseMove, %FoundX%, %FoundY%, 0
					click
				}
				return
			#ifwinactive

		; After verifying quality of fingerprints, save fingerprints and prepare for next barcode scan by pressing 3-3-3:
		:*:33ee::
			#ifwinactive, ahk_class FNWND3105
				send !c
				sleep 250
				send !{F4}
				sleep 250
				send y
				sleep 250
				send ^a
				return
			#ifwinactive
		;After submitting fingerprints, go directly into leaving a case remark by pressing 4-4-4:
		:*:44ee::
			#ifwinactive, ahk_class FNWND3105
				send !c
				sleep 250
				send !m
				sleep 250
				send !n
				return
			#ifwinactive
		;After typing a case remark, submit the remark, close file, prepare for next barcode scan by pressing 5-5-5:
		:*:55ee::
			#ifwinactive, ahk_class FNWND3105
				send !t
				sleep 250
				send !{F4}
				sleep 250
				send !y
				sleep 250
				send ^a
				return
			#ifwinactive
				
	;ANNOTATIONS:
		:*:bf2  ::Best fingerprints after two attempts.{space}{space}
		:*:s11  ::Applicant has scar on left index finger.{space}{space}
		:*:s21  ::Applicant has scar on right index finger.{space}{space}
		:*:agd  ::No indication applicant deliberately gave poor fingerprints.{space}{space}


;OPEN 11C Report:
	:*:open11c::
		#ifwinactive, ahk_class FNWNS3105
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\REPORTS.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click
			sleep 100
			send !x
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\REPORTS.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click
			sleep 100
			loop 8
			{
				send {tab}
			}
			loop 30
			{
				send {down}
			}
			send {space}{enter}
			Return
		#IfWinActive
;C1/D INTERVIEW NOTES:
	:*:pilotbcd..::
		#ifwinactive, ahk_class FNWNS3105
			Send, Pilot.  Crew ID and company letter presented.  Overcomes 214b.  Issue B1/B2 and C1/D.
			Send, !t
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click right
			sleep 500
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\1_OF_2.bmp
			if ErrorLevel=0 ; Two visas already entered
			{
				send, !c
				sleep 100								 
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Window
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
				sleep 100
				CoordMode, Mouse, Window
				MouseMove, %FoundX%, %FoundY%
				sleep 100
				Click
				sleep 100
				Send, !m
				MsgBox, Visa Clerk already selected B1/B2 in addition to C1/D during intake.
				Return  
			}
			else if ErrorLevel=1 ; Only one visa currently entered
			{
				send, !c
				sleep 100								 
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Window
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
				sleep 100
				CoordMode, Mouse, Window
				MouseMove, %FoundX%, %FoundY%
				sleep 100
				Click 2
				sleep 100
				send, {F6}
				sleep 100
				Send, b1/b2
				send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{space}
				sleep 500
				send, !{F3}
				sleep 500
				send, !{F4}
				sleep 500
				send, {space}
				sleep 500
				send, {space}
				sleep 500
				send, !m
				MsgBox, B1/B2 visa added to application.
				Return
			}
			else
			{
				MsgBox, Unknown error.
				Return
			}
			Return
		#ifwinactive
		Return
			
	:*:pilotnob..::Pilot.  Crew ID and company letter presented.  Overcomes 214b.  Issue only C1/D.
	:*:attendant..::Flight attendant.  Crew ID and company letter presented.  Overcomes 214b.  Issue only C1/D.
	:*:attendantbcd..::
		#ifwinactive, ahk_class FNWNS3105
			Send, Flight attendant.  Crew ID and company letter presented.  Overcomes 214b.  Issue B1/B2 and C1/D.
			Send, !t
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click right
			sleep 500
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\1_OF_2.bmp
			if ErrorLevel=0 ; Two visas already entered
			{
				send, !c
				sleep 100								 
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Window
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
				sleep 100
				CoordMode, Mouse, Window
				MouseMove, %FoundX%, %FoundY%
				sleep 100
				Click
				sleep 100
				Send, !m
				MsgBox, Visa Clerk already selected B1/B2 in addition to C1/D during intake.
				Return  
			}
			else if ErrorLevel=1 ; Only one visa currently entered
			{
				send, !c
				sleep 100								 
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Window
				ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
				sleep 100
				CoordMode, Mouse, Window
				MouseMove, %FoundX%, %FoundY%
				sleep 100
				Click 2
				sleep 100
				send, {F6}
				sleep 100
				Send, b1/b2
				send, {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{space}
				sleep 500
				send, !{F3}
				sleep 500
				send, !{F4}
				sleep 500
				send, {space}
				sleep 500
				send, {space}
				sleep 500
				send, !m
				MsgBox, B1/B2 visa added to application.
				Return
			}
			else
			{
				MsgBox, Unknown error.
				Return
			}
			Return
		#ifwinactive
		Return
	:*:sailor..::Sailor.  Seaman's book, seaman's ID, company letter, crew list presented.  Overcomes 214b.  Issue C1/D.

;B1/B2 Interview Notes:
	:*:nivdomestic..::
		#ifwinactive, ahk_class FNWNS3105
			Send, Wilberforce pamphlet provided.  Interviewing officer confirmed pamphlet has been received, read, and understood by applicant.  In compliance with 9 e-FAM 402.03-09(C)(2).
			Send, !t
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click right
			sleep 500
			Send, B1 {tab}
			Send, M {tab}
			Send, 12 {tab}{tab}{tab}{tab}{tab}{tab}
			Send, PERSONAL OR DOMESTIC EMPLOYEE OF {tab}
			Send, NONIMMIGRANT APPLICANT {tab}
			MsgBox, Press enter and type employer's name
			Return
		#ifwinactive
		Return
	:*:usdomestic..::
		#ifwinactive, ahk_class FNWNS3105
			Send, Wilberforce pamphlet provided.  Interviewing officer confirmed pamphlet has been received, read, and understood by applicant.  In compliance with 9 e-FAM 402.03-09(C)(2).
			Send, !t
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click right
			sleep 500
			Send, B1 {tab}
			Send, M {tab}
			Send, 12 {tab}{tab}{tab}{tab}{tab}{tab}
			Send, PERSONAL OR DOMESTIC EMPLOYEE OF {tab}
			Send, U.S. CITIZEN {tab}
			MsgBox, Press enter and type employer's name
			Return
		#ifwinactive
		Return
	:*:bh..::
		#ifwinactive, ahk_class FNWNS3105
			Send, Wilberforce pamphlet provided.  Interviewing officer confirmed pamphlet has been received, read, and understood by applicant.  In compliance with 9 e-FAM 402.03-09(C)(2).
			Send, !t
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click right
			sleep 500
			Send, B1 {tab}
			Send, M {tab}{tab}{tab}{tab}{tab}{tab}{tab}
			Send, B in lieu of H, 9 e-FAM 402.02-05(F){tab}
			Return
		#ifwinactive
		Return
	:*:lmtd..::
		#ifwinactive, ahk_class FNWNS3105
			Send, #LMTD
			Send, !t
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Window
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\ROW_ARROW.bmp
			Sleep 100
			CoordMode, Mouse, Window
			MouseMove, %FoundX%, %FoundY%, 1
			sleep 100
			Click right
			sleep 500
			send, {tab}
			send, M {tab}
			send, 12
			Return
		#ifwinactive
		Return
;SUMMER WORK AND TRAVEL NOTES:
	:*:swt..::English:{space}{enter}Ties:{space}{enter}Wilberforce Pamphlet: Received, read, and understood{space}{enter}Student year:{space}{enter}Alum: (include #SWTALUM here if app has participated before, otherwise delete this line from notes){space}{enter}SEVIS:{space}{enter}Search terms: #SWT2015{space}{enter}Placement: No adverse information on employer available to adjudicator.{enter}

;Wilberforce:
	:*:wilberforce..::Wilberforce pamphlet provided.  Interviewing officer confirmed pamphlet has been received, read, and understood by applicant, in compliance with 9 e-FAM 402.03-09(C)(2).

;Technology Access List:
	:*:notal..::No apparent TAL concern.
	:*:yestal..::TAL concern; experience in
;INTERVIEW WAIVER PROGRAM HOTKEYS:
	:*:iwp..::IWPCase. All unexpired visas of same type CWOPed.  All required documents presented.{space}{space}
	:*:iwpphoto..::IWPCase. Prior visas CWOPed. 221g pending new photo.{space}{space}
	:*:iwpsao..::IWPCase but needs interview for possible SAO. Please ask app to bring CV and list of any publications to interview.{space}{space}
	:*:iwpint..::Applying via IWP, but interview needed due to
	:*:iwpresi..::IWPCase but doesn't qualify.  Not a resident of Moscow's consular district in regard to IWP. Needs interview here, or can reapply IWP in Minsk.{space}{space}
	:*:adisok..::ADIS shows no derogatory information.{space}{space}
	:*:iwpage..::IWPCase. Interview Waiver Based on Age as set forth in 9 e-FAM 403.05-04(A)(1).{space}{space}
	;Issue IWP without selecting "Interview Action: Waived":
		#ifwinactive, ahk_class FNWNS3105
			!i::
			send {tab}
			sleep, 100
			send {tab}
			sleep, 100
			send {tab}
			send !o
			sleep, 50
			#ifwinactive, 
			send {up}
			return
		#ifwinactive

;OPEN CEAC (opens CEAC, moves the mouse into the field area, and clicks - you can now scroll down by pressing the space bar.) 
	#ifwinactive, ahk_class FNWND3105	
		!e::
			send !e
			sleep, 100
			outer0:
			Loop, 500
			{
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Screen
				ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\STATUS.bmp	
				if ErrorLevel = 0
				{
					CoordMode, Mouse, Screen
					MouseMove, %FoundX%, %FoundY%, 1
					Click
					break outer0
				}
				sleep 10
				send ^{PgUp}
			}
			break_outer0:
			Return
	#ifwinactive

	#ifwinactive, ahk_class FNWND3105	
		:*:e..::
			send !e
			sleep, 100
			outer3:
			Loop, 100
			{
				CoordMode, Mouse, Screen
				MouseMove, 0, 0, 0
				CoordMode, Pixel, Screen
				ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\STATUS.bmp	
				Sleep, 10
				if ErrorLevel = 0
				{
					CoordMode, Mouse, Screen
					MouseMove, %FoundX%, %FoundY%, 1
					Click
					break outer3
				}
			}
			if ErrorLevel = 1
			{
				MsgBox, Loading of CEAC timed out.  Search of terms of concern cancelled.
				Return
			}
			break_outer3:
			send ^f
			sleep 100
			send, iran
			sleep, 50
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NO_MATCH_FOUND.bmp	
			Sleep, 50
			If ErrorLevel = 1
			{
				MsgBox, Search term "Iran" found.
			}
			send {Shift Down}{home}{Shift Up}{Backspace}
			send, syria
			sleep 50
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NO_MATCH_FOUND.bmp	
			Sleep, 50
			If ErrorLevel = 1
			{
				MsgBox, Search term "Syria" found.
			}
			send {Shift Down}{home}{Shift Up}{Backspace}
			send, sudan
			sleep 50
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NO_MATCH_FOUND.bmp	
			Sleep, 50
			If ErrorLevel = 1
			{
				MsgBox, Search term "Sudan" found.
			}
			send {Shift Down}{home}{Shift Up}{Backspace}
			send, yemen
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NO_MATCH_FOUND.bmp	
			Sleep, 50
			If ErrorLevel = 1
			{
				MsgBox, Search term "Yemen" found.
			}
			send {Shift Down}{home}{Shift Up}{Backspace}
			send !{F4}
			send ^{PgUp}
			MsgBox, Search of terms of concern completed.	
			Return
	#ifwinactive

;IAFIS RESUB CLEARANCE:
	:*:inkok..::Fingerprint Quality Poor, INK name check contains no matching derogatory records.  Name check and override conform to 9 e-FAM 303.07-06(C)(2).
;ANNOTATIONS:
	:*:bh..::B in lieu of H, 9 e-FAM 402.02-05(F)
	:*:b2study..::STUDY INCIDENTAL TO VISIT; Form I-20 NOT REQUIRED
	:*:fordomemp..::PERSONAL OR DOMESTIC EMPLOYEE OF NONIMMIGRANT APPLICANT (INSERT EMPLOYER'S NAME)
	:*:usdomemp..::PERSONAL OR DOMESTIC EMPLOYEE (INSERT EMPLOYER's NAME)

;OVERRIDE HIT:
	#ifwinactive, ahk_class FNWNS3105
		:*:name..::NAME OF APPLICANT DIFFERENT{enter}
		:*:DOB..::DOB OF APPLICANT DIFFERENT{enter}
		:*:COB..::COB OF APPLICANT DIFFERENT{enter}
		:*:info..::INFO AT POST INDICATES APPLICANT NOT SAME PERSON{enter}
		:*:dept..::DEPT OR OTHER POST RESPONSE INDICATES NOT SAME PERSON{enter}
		:*:gender..::GENDER OF APPLICANT DIFFERENT{enter}
	#ifwinactive

;INTERNAL OFFICE NOTES:
	:*:takeppt..::Passport returned at interview.  221g for passport.
	:*:sameday..::Applicant has urgent travel, expedite printing.  Same day cashier passport return from cashier at 3PM authorized.
	:*:nextday..::Applicant has urgent travel, expedite printing.  Next day cashier passport return from cashier at 3PM authorized.
	:*:PIMS..::Petition not appearing in PIMS.  Please contact KCC to resolve.
	:*:fpuok..::ECAS case closed.  See ECAS case summary and findings for more details.  Case and passport returned to adjudicating officer.
	:*:fpuppt..::ECAS case closed.  See ECAS case summary and findings for more details.  Case, without passport, returned to adjudicating officer.
	:*:referfpu..::
		#ifwinactive, ahk_class FNWNS3105
			send, ^t
			sleep, 100
			send, ^s
			sleep, 100
			send, {right}{right}{right}
			sleep, 100
			send, ^s
			sleep, 100
			send, g {tab}{tab}{tab}{tab}
			send, FPU Referral
			send, ^f
			sleep, 100
			send, ^y
			MsgBox, Please enter FPU referral information.
		#ifwinactive
		Return
;CLOSE CURRENT WINDOW:
	;Close current window using ALT+F4 instead of CTRL+F4:
		#ifwinactive, ahk_class FNWNS3105
			!F4::
			send ^{F4}
			return
		#ifwinactive

;PROCESS NO_OBJECTION SAO RESPONSES:
	;Process all SAO "NO_OBJECTION" responses by pressing CTRL+ALT+P:
	^!p::
		Send ^l
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\CLEARANCE_TYPE.bmp
		if ErrorLevel = 2
		{
			MsgBox, Could not conduct the search.  Error type 2.
			return
		}
		if ErrorLevel = 1
		{
			MsgBox, "Clearance Type" field not found.  Error type 1.
			return
		}
		sleep 100
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		click
		sleep 100
		send {tab}
		loop, 15
		{
			send {down}
		}
		send {up}
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\0_RECORDS_FOUND.bmp
		If ErrorLevel = 0
		{
			Goto, EndSAO
		}
		Loop, 6
		{
			send {tab}
			sleep 10
		}
		Loop, 10
		{
			send {down}
			sleep 10
		}
		send {up}
		sleep 10
		send {tab}
		sleep 10
		send {tab}
			Loop, 10
		{
			send {down}
			sleep 10
		}
		loop, 4
		{
			send {up}
			sleep 10
		}
		sleep 100
		send {tab}
		sleep 100
		loop
		{
			send {up}
			sleep 100
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\SELECT_BY_ALL.bmp
			If ErrorLevel = 0
			{
				Goto, ContinueSAO
			}
			send {shift down}{tab}{shift up}
		}
		ContinueSAO:
		send {enter}
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\0_RECORDS_FOUND.bmp
		If ErrorLevel = 0
		{
			Goto, EndSAO
		}
		Loop, 10
		{
			Send {Tab}
			sleep 10
		}
		Send {Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}{Backspace}
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\0_RECORDS_FOUND.bmp
		If ErrorLevel = 0
		{
			Goto, EndSAO
		}
		outer2:
		Loop
		{	
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\RECEIVED_NO_OBJECTION.bmp
			if ErrorLevel = 2
			{
				MsgBox, Could not conduct the search
				break outer2
				return
			}
			if ErrorLevel = 1
			{
				MsgBox, No more "No Objection" SAO responses could be found.
				break outer2
				return
			}
			if ErrorLevel = 0
			{
				CoordMode, Mouse, Screen
				MouseMove, %FoundX%, %FoundY%
				sleep 50
				click 2
				sleep 50
				send {tab}{tab}{tab}
				sleep 50
				send {space}
				sleep 50
				send {space}
				sleep 50
				send, {lctrl down}{f4}{lctrl up}
				send {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}
				sleep 100
				send {space}
				sleep 100
				send {Down}
				sleep 50
				send {Up}
				return
			}
		}
		break_outer2:
		EndSAO:
		return

;RETRIEVE IDENT PENDING REVIEW FOR OFFICER:
	:*:prepident::
		send ^l
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\CLEARANCE_TYPE.bmp
		sleep 500
		if ErrorLevel = 2
		{
			MsgBox, Could not conduct the search.  Error type 2.
			return
		}
		if ErrorLevel = 1
		{
			MsgBox, "Clearance Type" field not found.  Error type 1.
			return
		}
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		click
		sleep, 10
		send {tab}
		sleep, 10
		send {down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}
		loop 4,
		{
			send {up}
			sleep, 10
		}
		send {tab}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}
		send {tab}{up}{up}{up}{up}{down}
		send {tab}
		send, 01jan
		send, %A_YYYY%
		send {tab}
		send, 31dec
		send, %A_YYYY%
		send {tab}{tab}{tab}
		sleep, 10
		loop, 15
		{
			send {down}
			sleep, 10
		}
		loop, 9
		{
			send {up}
			sleep, 10
		}
		sleep 10
		send {tab}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}{up}
		sleep 10
		send {tab}
		loop
		{
			send {up}
			sleep 10
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\SELECT_BY_ALL.bmp
			sleep, 10
			If ErrorLevel = 0
			{
				Goto, ContinueIDENT
			}
			send {shift down}{tab}{shift up}
		}
		ContinueIDENT:
		send {down}
		Run, Z:\Desktop\CCD_USERNAME.txt
		sleep 100
		send ^a
		sleep 10
		send ^c
		sleep 10
		send !{F4}
		sleep 10
		send ^v
		send {enter}
		Return

;RETRIEVE IAFISPENDING REVIEW FOR OFFICER:		
	:*:prepiafis::
		send ^l
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\CLEARANCE_TYPE.bmp
		sleep 500
		if ErrorLevel = 2
		{
			MsgBox, Could not conduct the search.  Error type 2.
			return
		}
		if ErrorLevel = 1
		{
			MsgBox, "Clearance Type" field not found.  Error type 1.
			return
		}
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		click
		send {tab}
		loop, 15
		{
			send {down}
			sleep 10
		}
		loop, 5
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop, 15
		{
			send {up}
			sleep 10
		}
		send {tab}
		send {up}{up}{up}{up}{down}
		send {tab}
		send, 01jan
		send, %A_YYYY%
		send {tab}
		send, 31dec
		send, %A_YYYY%
		send {tab}{tab}{tab}
		loop, 15
		{
			send {down}
			sleep 10
		}
		loop, 3
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop, 4
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop
		{
			send {up}
			sleep 10
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\SELECT_BY_ALL.bmp
			sleep, 10
			If ErrorLevel = 0
			{
				Goto, ContinueIAFIS
			}
			send {shift down}{tab}{shift up}
		}
		ContinueIAFIS:
		send {down}
		Run, Z:\Desktop\CCD_USERNAME.txt
		sleep 100
		send ^a
		sleep 10
		send ^c
		sleep 10
		send !{F4}
		sleep 10
		send ^v
		send {enter}
		Return

;RETRIEVE FR PENDING REVIEW FOR OFFICER:
	:*:prepfr::
		send ^l
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\CLEARANCE_TYPE.bmp
		sleep 500
		if ErrorLevel = 2
		{
			MsgBox, Could not conduct the search.  Error type 2.
			return
		}
		if ErrorLevel = 1
		{
			MsgBox, "Clearance Type" field not found.  Error type 1.
			return
		}
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		click
		send {tab}
		loop, 15
		{
			send {down}
			sleep 10
		}
		loop, 7
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop, 15
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop, 4
		{
			send {up}
			sleep 10
		}
		send {down}
		send {tab}
		send, 01jan
		send, %A_YYYY%
		send {tab}
		send, 31dec
		send, %A_YYYY%
		send {tab}{tab}{tab}
		loop, 15
		{
			send {down}
			sleep 10
		}
		loop, 5
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop, 15
		{
			send {up}
			sleep 10
		}
		send {tab}
		loop
		{
			send {up}
			sleep 10
			CoordMode, Mouse, Screen
			MouseMove, 0, 0, 0
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, H:\AutoHotkey\ImageSearch\SELECT_BY_ALL.bmp
			sleep, 10
			If ErrorLevel = 0
			{
				Goto, ContinueFR
			}
			send {shift down}{tab}{shift up}
		}
		ContinueFR:
		send {down}
		Run, Z:\Desktop\CCD_USERNAME.txt
		sleep 100
		send ^a
		sleep 10
		send ^c
		sleep 10
		send !{F4}
		sleep 10
		send ^v
		send {enter}
		Return

;PROCESS INK SUBMISSIONS FOR IAFIS RESUB REQUESTS:
	:*:prepink::
		Send ^l
		send !r
		Send {tab}
		loop 15
		{
			send {down}
		}
		loop 5
		{
			send {up}
		}
		send {tab}
		loop 15
		{
			send {up}
		}
		loop 6
		{
			send {tab}
		}
		loop 15
		{
			send {down}
		}
		loop 3
		{
			send {up}
		}
		send {tab}
		loop 5
		{
			send {up}
		}
		send {tab}
		loop 6
		{
			send {up}
		}
		send {down}{tab}
		loop 20
		{
			send {delete}
		}
		send !r
		return
	!9::
 		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\BLACK_ROW_ARROW.bmp
		Sleep 50
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		if ErrorLevel = 2
		{
			MsgBox, Error 2
		}
		if ErrorLevel = 1
		{
			MsgBox, Error 1
		}
		sleep 50
		Click 2
		Send !a
		sleep 50
		send {enter}
		loop 8
		{
			send {tab}
		}
		send ^c
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\IND_NAMECHECK.bmp
		Sleep 50
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		click
		sleep 4000
		Send !t
		sleep 50
		send i
		sleep 50
		send {F2}
		sleep 50
		send ^v
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send ^c
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send ^v
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send {shift down}
		sleep 50
		loop 15
		{
			send {right}
		}
		send {shift up}
		sleep 50
		send ^c
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		send ^v
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send {tab}
		send ^c
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send ^v
		sleep 50
		send !{tab}
		sleep 50
		send {left}
		sleep 50
		send {tab}
		sleep 50
		send ^c
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send ^v
		sleep 50
		send !{tab}
		sleep 50
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NIV_GENDER_F.bmp
		sleep 50
		if ErrorLevel = 0
		{
			send !{tab}
			sleep 50
			send {tab}
			send F
			sleep 50
			send !{tab}
			sleep 50
		}
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NIV_GENDER_M.bmp
		sleep 50
		if ErrorLevel = 0
		{
			send !{tab}
			sleep 50
			send {tab}
			sleep 50
			send M
			sleep 50
			send !{tab}
		}
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\ALIAS_SURNAME.bmp
		sleep 100
		if ErrorLevel = 2
		{
			MsgBox, Error Level 2
		}
		if ErrorLevel = 1
		{
			MsgBox, Error Level 1
		}
		if ErrorLevel = 0
		{
			CoordMode, Mouse, Screen
			MouseMove, %FoundX%, %FoundY%, 0
			sleep 50
			click
			MouseMove, 50, 50, 0
		}
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 3000, 4000, H:\AutoHotkey\ImageSearch\2_ALIAS.bmp
		sleep 50
		if ErrorLevel = 0
		{
			send ^c
			sleep 50
			send !{tab}
			sleep 50
			send {tab}{tab}{tab}
			sleep 50
			send ^v
			sleep 50
			send !{tab}
			sleep 50
			send {tab}
			sleep 50
			send ^c
			sleep 50
			send !{tab}
			sleep 50
			send {tab}
			sleep 50
			send ^v
			sleep 50
			
			send !{tab}
			sleep 50
			send {tab}
			sleep 50
			send ^c
			sleep 50
			send !{tab}
			sleep 50
			send {F5}
			sleep 50
			send ^v
			sleep 50
			send !{tab}
			sleep 50
			send {tab}
			sleep 50
			send ^c
			sleep 50
			send !{tab}
			sleep 50
			send {tab}
			send ^v
			sleep 50
			Goto, closeoutandsave
		}
		sleep 50
		send {home}{space}{shift down}{left}{shift up}		
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 4000, 4000, H:\AutoHotkey\ImageSearch\NO_ALIAS.bmp
		sleep 50
		if ErrorLevel = 0
		{
			send {delete}
			sleep 50
			send !{tab}
			sleep 50
			Goto, closeoutandsave
		}
		send {delete}
		sleep 50
		send {shift down}
		loop 50
		{
			send {right}
		}
		send {shift up}
		send ^c
		sleep 50
		send !{tab}
		sleep 50
		send {tab}{tab}{tab}
		sleep 50
		send ^v
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send ^c
		sleep 50
		send !{tab}
		sleep 50
		send {tab}
		sleep 50
		send ^v
		sleep 50
				
		closeoutandsave:
		send {F3}
		sleep 50
		send ^{F4}
		sleep 50
		send {enter}
		sleep 50
		send !{F4}
		sleep 50
		send {enter}
		sleep 100
		MouseMove, 0, 0, 0
		sleep 100
		CoordMode, Mouse, Screen
		MouseMove, 0, 0, 0
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, 0, 0, 16000, 16000, H:\AutoHotkey\ImageSearch\CASE_NUMBER.bmp
		Sleep 100
		if ErrorLevel = 2
		{
			MsgBox, Error Level 2
		}
		if ErrorLevel = 1
		{
			MsgBox, Error Level 1
		}
		CoordMode, Mouse, Screen
		MouseMove, %FoundX%, %FoundY%
		Click
		sleep 50
		send !{F4}
		send {enter}
		sleep 50
		send !c
		sleep 50
		send {tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}{tab}
		sleep 50
		send {down}
		Return

;Prevent Errant Printing in NIV:		
	^p::
		#ifwinactive, ahk_class FNWND3105
			MsgBox, You pressed Ctrl+P.  To prevent errant printing while NIV is running, this shortcut has been disabled.  You must manually click the print option. 
		#ifwinactive

;Prevent Runaway AutoHotkey Scripts:
	Esc:: ExitApp

;Allow for "Select All" and Copy in active remarks field:
	:*:sa..::
		#ifwinactive, ahk_class FNWD3105
			send ^{home}
			send {shift down}
			send ^{end}
			send {shift up}
			send {AppsKey}
			send {down 3}{enter}
			return	
		#ifwinactive	