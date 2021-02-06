var firebaseConfig = {
    apiKey: "AIzaSyBZhwcdHrV9GXcv3ED1ao7TvivnxzSv1zE",
    authDomain: "learn-with-ar.firebaseapp.com",
    projectId: "learn-with-ar",
    storageBucket: "learn-with-ar.appspot.com",
    messagingSenderId: "645245752414",
    appId: "1:645245752414:web:76593d44f93d25ffd710cf",
    measurementId: "G-5H5ERW5WXF"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();
const auth = firebase.auth();
const txtEmail = document.getElementById('txtEmail');
const txtPassword = document.getElementById('txtPassword');
const btnLogin = document.getElementById('btnLogin');
const btnUpload = document.getElementById('btnUpload');
const whenSignedIn = document.getElementById('whenSignedIn');
const whenSignedOut = document.getElementById('whenSignedOut');
var txtDescription = document.getElementById('txtDescription');
var txtType = document.getElementById('txtType');
const signInBtn = document.getElementById('signInBtn');
const signOutBtn = document.getElementById('signOutBtn');

const userDetails = document.getElementById('userDetails');


const provider = new firebase.auth.GoogleAuthProvider();

/// Sign in event handlers
btnLogin.addEventListener('click',e=>{
    const email = txtEmail.value;
    const pass =txtPassword.value;
    const promise =auth.signInWithEmailAndPassword(email,pass);
    promise.catch(e=> console.log(e.message));
});
signInBtn.onclick = () => auth.signInWithPopup(provider);

signOutBtn.onclick = () => auth.signOut();

auth.onAuthStateChanged(user => {
    if (user) {
        // signed in
        whenSignedIn.hidden = false;
        whenSignedOut.hidden = true;
        userDetails.innerHTML = `<h3>Hello !</h3> <p>User ID:</p>`;
    } else {
        // not signed in
        whenSignedIn.hidden = true;
        whenSignedOut.hidden = false;
        userDetails.innerHTML = '';
    }
});

var uploader = document.getElementById('uploader');
var fileButton = document.getElementById('fileButton');

fileButton.addEventListener('change',function(e)
{
    var file= e.target.files[0];
    var storageRef = firebase.storage().ref(file.name);
    var task = storageRef.put(file);
    task.on('state_changed',
        function progress(snapshot)
        {var percentage= (snapshot.bytesTransferred/snapshot.totalBytes)*100;
            uploader.value =percentage;},
        function error(err)
        {

        },
        function complete(){}
        );
});

var uploader1 = document.getElementById('uploader1');
var fileButton1 = document.getElementById('fileButton1');
fileButton1.addEventListener('change',function(e)
{
    var file1= e.target.files[1];
    var storageRef1 = firebase.storage().ref('image/'+file1.name);
    var task1 = storageRef1.put(file1);
    task1.on('state_changed',
        function progress(snapshot)
        {var percentage1= (snapshot.bytesTransferred/snapshot.totalBytes)*100;
            uploader1.value =percentage1;},
        function error(err)
        {

        },
        function complete(){}
        );
});

///// Firestore /////

const db = firebase.firestore();

const createThing = document.getElementById('createThing');
const thingsList = document.getElementById('thingsList');


let thingsRef;
let unsubscribe;

auth.onAuthStateChanged(user => {

    if (user) {

        // Database Reference
        thingsRef = db.collection('things')

        btnUpload.onclick = () => {

            const { serverTimestamp } = firebase.firestore.FieldValue;

            thingsRef.add({
                uid: user.uid,
                type: txtType,
                description: txtDescription,
                createdAt: serverTimestamp()
            });
        }


        // Query
        unsubscribe = thingsRef
            .where('uid', '==', user.uid)
            .orderBy('createdAt') // Requires a query
            .onSnapshot(querySnapshot => {
                
                // Map results to an array of li elements

                const items = querySnapshot.docs.map(doc => {

                    return `<li>${doc.data().name}</li>`

                });

                thingsList.innerHTML = items.join('');

            });



    } else {
        // Unsubscribe when the user signs out
        unsubscribe && unsubscribe();
    }
});