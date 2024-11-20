/*
    Objeto Event.
    La informacion esta en el html.

    |   Ejercicio de event flow
*/
let padre = document.querySelector('.padre');
let hijo = document.querySelector('.hijo');
let botonHijo = document.getElementById('boton-hijo');

padre.style.padding = '10px';
padre.style.textAlign = 'center';
padre.addEventListener('click',(e) =>{
    let padreInfo = document.createElement('p');
    padreInfo.textContent = 'burbujeo el evento padre';
    padre.appendChild(padreInfo);
    console.log('padre');
});

hijo.style.padding = '10px';
hijo.addEventListener('click',(e) => {
    let hijoInfo = document.createElement('p');
    hijoInfo.textContent = 'burbujeo el evento hijo';
    hijo.appendChild(hijoInfo);
    console.log('hijo');
});

botonHijo.addEventListener('click',(e) => {
    botonHijo.textContent = 'Se hizo click en el boton';
    console.log("boton hijo");
});

let intro = document.getElementById('intro');
intro.classList.remove('visible');
document.getElementById('apachurrale').addEventListener('click',() => {
    intro.classList.add('visible');
});

/*
    |   Ejercicio de Eventos del mouse
*/
let unClick = document.querySelector('.e-click');
let btnUnClick = document.getElementById('eventoUnClick');
const funcionUnClick = () => {
    btnUnClick.classList.add('precionado');
    btnUnClick.textContent = 'El boton ha sido precionado una vez';

    if(!document.querySelector('.confirmacionUnClick')){
        let resultP = document.createElement('p');
        resultP.style.borderBottom = '1px solid #a8a8a8';
        resultP.style.width = 'fit-content';
        resultP.textContent = 'Este texto confirma que se preciono el boton una vez';
        resultP.classList.add('confirmacionUnClick');
        unClick.appendChild(resultP);
    }
    btnUnClick.removeEventListener('click',funcionUnClick);
}
btnUnClick.addEventListener('click',funcionUnClick);

let dosClicks = document.querySelector('.e-dbclick');
let btn2Click = document.getElementById('evento2Click');
const funcionDobleClick = () => {
    btn2Click.classList.add('precionado');
    btn2Click.textContent = 'El boton ha sido precionado dos veces';

    if(!document.querySelector('.confirmacionDosClick')){
        let resultP = document.createElement('p');
        resultP.style.borderBottom = '1px solid #a8a8a8';
        resultP.style.width = 'fit-content';
        resultP.textContent = 'Este texto confirma que se preciono el boton dos veces';
        resultP.classList.add('confirmacionDosClick');
        dosClicks.appendChild(resultP);
    }
    btn2Click.removeEventListener('dblclick',funcionDobleClick);
}
btn2Click.addEventListener('dblclick',funcionDobleClick);

document.querySelector('.mouse-move').addEventListener("mousemove", (e) => {
    let result = document.getElementById('result-mouseMove');
    result.style.border = '1px solid #a8a8a8';
    result.style.borderRadius = '8px';
    result.style.padding = '10px';
    result.style.position = 'absolute';
    result.style.left = '50%';
    result.style.top = '50%';
    result.style.transform = 'translate(-50%, -50%)';
    result.textContent = `X: ${e.clientX}, Y: ${e.clientY}`;
});

let resultmouseDown = document.getElementById('result-mouseDown');
const mouseDown = document.querySelector('.mouse-down');
mouseDown.addEventListener('mousedown', () => {
    resultmouseDown.textContent = 'Estas precionando el boton del mouse';
    resultmouseDown.style.display = 'block';
    resultmouseDown.style.width = 'fit-content';
    resultmouseDown.style.padding = '5px 10px';
    resultmouseDown.style.border = '2px solid #585858';
    resultmouseDown.style.borderRadius = '10px';
    resultmouseDown.style.position = 'absolute';
    resultmouseDown.style.top = '50%';
    resultmouseDown.style.left = '50%';
    resultmouseDown.style.transform = 'translate(-50%, -50%)';
});
mouseDown.addEventListener('mouseup', () => {
    resultmouseDown.style.display = 'none';
})

let divMouseEnter = document.querySelector('.resultado-mouse-enter');
let parrafMouseEnter = document.getElementById('resultMouseEnter');
parrafMouseEnter.classList.remove('visible');
divMouseEnter.addEventListener('mouseenter', () => {
    parrafMouseEnter.textContent = 'Este parrafo se activo por el mouse-enter';
    parrafMouseEnter.classList.add('visible');
});
divMouseEnter.addEventListener('mouseleave', () => {
    parrafMouseEnter.classList.remove('visible');
});

let divMouseOverPadre = document.querySelector('.mouse-over-padre');
let parrafMouseOverPadre = document.getElementById('result-mouseOver-padre');
divMouseOverPadre.addEventListener('mouseover', () => {
    parrafMouseOverPadre.classList.add('visible');
});
divMouseOverPadre.addEventListener('mouseout', () => {
    parrafMouseOverPadre.classList.remove('visible');
});
let divMouseOverHijo = document.querySelector('.mouse-over-hijo');
let parrafMouseOverhijo = document.getElementById('result-mouseOver-hijo');
divMouseOverHijo.addEventListener('mouseover', () => {
    parrafMouseOverhijo.classList.add('visible');
});
divMouseOverHijo.addEventListener('mouseout', () => {
    parrafMouseOverhijo.classList.remove('visible');
});

/*
    |   Ejercicios de Eventos del Teclado
*/
window.addEventListener('keydown', (e) => {
    let img = document.getElementById('img1');
    if(e.ctrlKey && e.key == 'i'){
        img.src = 'assets/lunes.jpeg';
        img.classList.add('visible');
    }
});
window.addEventListener('keyup', (e) => {
    let img = document.getElementById('img1');
    if(e.ctrlKey && e.key == 'i'){
        img.src = 'assets/lunes.jpeg';
        img.classList.remove('visible');
    }
});
window.addEventListener('keydown', (e) => {
    let img = document.getElementById('img2');
    if(e.ctrlKey && e.key == 'm'){
        img.src = 'assets/asco.jpeg';
        img.classList.add('visible');
    }
});
window.addEventListener('keyup', (e) => {
    let img = document.getElementById('img2');
    if(e.ctrlKey && e.key == 'm'){
        img.src = 'assets/asco.jpeg';
        img.classList.remove('visible');
    }
});
window.addEventListener('keydown', (e) => {
    let img = document.getElementById('img3');
    if(e.ctrlKey && e.key == 'b'){
        img.src = 'assets/kipp.jpeg';
        img.classList.add('visible');
    }
});
window.addEventListener('keyup', (e) => {
    let img = document.getElementById('img3');
    if(e.ctrlKey && e.key == 'b'){
        img.src = 'assets/kipp.jpeg';
        img.classList.remove('visible');
    }
});

/*
    |   ejercicio preventDefault
*/
let divLink = document.querySelector('.link');
let checkBox = divLink.querySelector('input');
document.querySelector('a').addEventListener('click', (e) => {
    if(!checkBox.checked){
        e.preventDefault();
        alert('Necesitas presionar el checkbox para apachurrarle al link.');
    }
});
let formulario = document.getElementById('boton-formulario');
let inputEmailpd = document.getElementById('boton-email');
formulario.addEventListener('submit', (e) => {
    if(!inputEmailpd.value.includes('popo')){
        e.preventDefault();
        alert(`Es necesario que el email ingresado: ${inputEmailpd.value} contenga popo`);
    }
});

/*
    |   ejercicio eventos formulario
*/
let formulariofocus = document.querySelector('.form-focus');
let inputNombreF = document.getElementById('nombre');
let inputMatriculaF = document.getElementById('matricula');
let pFocus = document.getElementById('p-focus');
pFocus.classList.remove('visible');
inputNombreF.addEventListener('focus', () => {
    pFocus.classList.add('visible');
})
inputNombreF.addEventListener('blur', () => {
    pFocus.classList.remove('visible');
    pFocus.textContent = '';
})