  usuarios=['cordinador','instructor'];
 claves=['admin','user'];
///////////////////////////////////////////////////////////////////////////////////////////
 function Entrada() {
 user = document.getElementById('usuario').value
 pass = document.getElementById('clave').value
 if(user == '' ) {
   alert('Debe ingresar nombre de Usuario y contraseña')
   document.getElementById('usuario').focus()
   return false
 } 
 else
  if(pass == '' ) {
   alert('Debe ingresar nombre de Usuario y contraseña')
   document.getElementById('clave').focus()
   return false
 } 

 var s = 0
 c = usuarios.length
 var i = 0;
 for(i=0;i<c;i++) {
   if(user == usuarios[i] && pass == claves[i]) {
     alert('Bienvenido')
     s = 1
     return true;
   } 
 }
 if(s == 0) {
   alert('Usuario o Contraseña Incorrectos')
   return false
 } 
}