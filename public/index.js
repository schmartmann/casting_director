'use strict'

const getFormValues = (e) => {
    e.preventDefault()
    const form = document.getElementById('form');
    const inputs = Object.values(form).reduce((obj,field) => { obj[field.name] = field.value; return obj }, {})
    sendRequest(inputs)
}

const sendRequest = ({ actors, characters }) => {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/cast", true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.send(JSON.stringify({
        actors,
        characters  
    }));
}


const submitButton = document.getElementById('submit');
submitButton.addEventListener('click', getFormValues)