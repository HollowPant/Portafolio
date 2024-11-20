const preview = document.getElementById('preview'),
    styles = document.getElementById('styles'),
    ranges = document.querySelectorAll('.settings input'),
    copyButton = document.getElementById('copy-styles');

/* 
    La variable ranges selecciono todos los elementso input del html. Por medio de un foreach
    Le vamos añadir un evento a cada elemento guardado en esa variable
*/
ranges.forEach((slider) => {
    slider.addEventListener('input', generateStyles);
});

/*
    Ahora haremos la funcion `generateStyles`, 
    esta funcion es la que le dara los eventos a los ranges
*/
function generateStyles(){
    const xShadow = document.getElementById('x-shadow').value;
    const yShadow = document.getElementById('y-shadow').value;
    const blurRadius = document.getElementById('blur-r').value;
    const spreadRadius = document.getElementById('spread-r').value;
    const borderRadius = document.getElementById('border-r').value;
    const shadowOpacity = document.getElementById('shadow-opacity').value;
    const insetShadow = document.getElementById('inset-shadow').checked;
    const shadowColor = document.getElementById('shadow-color').value;
    
    /* Crearemos una variable que contenga reglas del box-shadow */
    const boxShadow = `${insetShadow ? "inset " : ""} ${xShadow}px ${yShadow}px ${blurRadius}px ${spreadRadius}px ${hexToRgba(shadowColor, shadowOpacity)}`;
    
    /* La variable boxShadow modificara la regla css de preview */
    preview.style.boxShadow = boxShadow;
    preview.style.borderRadius = `${borderRadius}px`;

    /* Actualizamos el valor del textarea */
    styles.textContent = `box-shadow: ${boxShadow}; \nborder-radius: ${borderRadius}px;`;
}

/* Con esta funcion descomponemos los colores */
function hexToRgba(shadowColor, shadowOpacity){
    const r = parseInt(shadowColor.substr(1,2),16);
    const g = parseInt(shadowColor.substr(3,2),16);
    const b = parseInt(shadowColor.substr(5,2),16);
    return `rgba(${r}, ${g}, ${b}, ${shadowOpacity})`;
}

/* Funcion para copiar el codigo generado */
function copyStyles(){
    styles.select();
    document.execCommand("copy");
    copyButton.innerText = "Copiado";
    setTimeout(()=>{
        copyButton.innerText = 'Copy Styles';
    }, 500);
}


generateStyles();