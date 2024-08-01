::del C:\Users\Windows\Desktop\work\qcom\signapk\new.apk
del E:\hexiaoming\qcom_data\three_splite_freeform\signapk\new_sign.apk
java -jar signapk.jar platform.x509.pem platform.pk8 newinterfaceapk_gbui17-debug.apk new_sign.apk
::del C:\Users\Windows\Desktop\work\qcom\signapk\new_sign.apk
adb install -t E:\hexiaoming\qcom_data\three_splite_freeform\signapk\new_sign.apk
pause