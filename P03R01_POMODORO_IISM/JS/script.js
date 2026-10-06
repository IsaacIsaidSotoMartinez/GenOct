// ============================================
// CONFIGURACIÓN
// ============================================

// Pomodoro de prueba.
// 10 segundos para poder comprobar rápidamente que funciona.
//const POMODORO_TIME = 10;

// Descanso de prueba.
// 10 segundos para poder comprobar rápidamente que funciona.
//const SHORT_BREAK_TIME = 10;
const POMODORO_TIME = 25 * 60;
const SHORT_BREAK_TIME = 5 * 60;

// ============================================
// ESTADO DE LA APLICACIÓN
// ============================================

// Guardamos el modo actual.
// Puede ser "pomodoro" o "shortBreak".
let currentMode = "pomodoro";

// Guardamos los segundos restantes.
let timeLeft = POMODORO_TIME;

// Indica si el temporizador está funcionando.
let isRunning = false;

// Aquí guardaremos el intervalo del temporizador.
let timerInterval = null;

// Contador general de Pomodoros terminados.
let completedPomodoros = 0;

// Arreglo donde guardaremos todas las tareas.
let tasks = [];


// ============================================
// ELEMENTOS DEL HTML
// ============================================

// Buscamos el reloj.
const timerElement = document.getElementById("timer");

// Buscamos el botón INICIAR / PAUSAR.
const startButton = document.getElementById("startButton");

// Buscamos el botón REINICIAR.
const resetButton = document.getElementById("resetButton");

// Buscamos el texto debajo del reloj.
const statusElement = document.getElementById("status");

// Buscamos el botón Pomodoro.
const pomodoroButton = document.getElementById("pomodoroButton");

// Buscamos el botón Descanso corto.
const shortBreakButton = document.getElementById("shortBreakButton");

// Buscamos el contador de Pomodoros.
const pomodoroCountElement =
    document.getElementById("pomodoroCount");

// Buscamos el formulario.
const taskForm = document.getElementById("taskForm");

// Buscamos el campo donde escribimos la tarea.
const taskInput = document.getElementById("taskInput");

// Buscamos la lista de tareas.
const taskList = document.getElementById("taskList");

// Buscamos el título de la sección de tareas.
const tasksTitle = document.getElementById("tasksTitle");

// Buscamos la tarjeta del temporizador.
const timerCard = document.querySelector(".timer-card");


// ============================================
// FORMATEAR TIEMPO
// ============================================

// Convierte segundos en formato MM:SS.
function formatTime(seconds) {

    // Calculamos los minutos.
    const minutes = Math.floor(seconds / 60);

    // Calculamos los segundos restantes.
    const remainingSeconds = seconds % 60;

    // Agregamos un cero delante de los minutos si es necesario.
    const formattedMinutes =
        String(minutes).padStart(2, "0");

    // Agregamos un cero delante de los segundos si es necesario.
    const formattedSeconds =
        String(remainingSeconds).padStart(2, "0");

    // Devolvemos el resultado.
    return `${formattedMinutes}:${formattedSeconds}`;
}


// ============================================
// ACTUALIZAR RELOJ
// ============================================

function updateTimerDisplay() {

    // Mostramos el tiempo en pantalla.
    timerElement.textContent = formatTime(timeLeft);

}


// ============================================
// OBTENER DURACIÓN DEL MODO
// ============================================

function getModeTime() {

    // Si estamos en Pomodoro...
    if (currentMode === "pomodoro") {

        // Devolvemos el tiempo del Pomodoro.
        return POMODORO_TIME;
    }

    // Si estamos en descanso...
    return SHORT_BREAK_TIME;
}


// ============================================
// ACTUALIZAR INFORMACIÓN DEL MODO
// ============================================

function updateStatus() {

    // Comprobamos si estamos trabajando.
    if (currentMode === "pomodoro") {

        // Texto del estado.
        statusElement.textContent =
            "Tiempo de concentración";

        // Color rojo para Pomodoro.
        timerCard.style.background = "#ba4949";

        // Cambiamos el título de las tareas.
        tasksTitle.textContent = "Tareas";

        // Cambiamos el texto del input.
        taskInput.placeholder =
            "¿En qué vas a trabajar?";

    }

    // Si estamos descansando...
    else {

        // Texto del estado.
        statusElement.textContent =
            "Descanso corto";

        // Color azul/verde para descanso.
        timerCard.style.background = "#38858a";

        // Cambiamos el título.
        tasksTitle.textContent =
            "Actividades de descanso";

        // Cambiamos el texto del input.
        taskInput.placeholder =
            "¿Qué quieres hacer durante tu descanso?";
    }

}


// ============================================
// ACTUALIZAR BOTÓN ACTIVO
// ============================================

function updateActiveButton() {

    // Quitamos la clase active del botón Pomodoro.
    pomodoroButton.classList.remove("active");

    // Quitamos la clase active del botón descanso.
    shortBreakButton.classList.remove("active");


    // Si estamos en Pomodoro...
    if (currentMode === "pomodoro") {

        // Activamos Pomodoro.
        pomodoroButton.classList.add("active");

    }

    // Si estamos en descanso...
    else {

        // Activamos descanso.
        shortBreakButton.classList.add("active");

    }

}


// ============================================
// CAMBIAR DE MODO
// ============================================

function changeMode(mode) {

    // Detenemos el temporizador.
    stopTimer();

    // Guardamos el nuevo modo.
    currentMode = mode;

    // Obtenemos el tiempo correspondiente.
    timeLeft = getModeTime();

    // Actualizamos el reloj.
    updateTimerDisplay();

    // Actualizamos el texto.
    updateStatus();

    // Actualizamos el botón activo.
    updateActiveButton();

    // Mostramos las tareas correspondientes.
    renderTasks();

}


// ============================================
// INICIAR TEMPORIZADOR
// ============================================

// ============================================
// INICIAR TEMPORIZADOR
// ============================================

function startTimer() {

    // Si el temporizador ya está funcionando,
    // no creamos otro intervalo.
    if (isRunning) {
        return;
    }

    // Indicamos que el temporizador está funcionando.
    isRunning = true;

    // Cambiamos el texto del botón.
    startButton.textContent = "PAUSAR";

    // Mostramos en consola que comenzó.
    console.log("TEMPORIZADOR INICIADO");

    // Creamos el intervalo.
    timerInterval = setInterval(() => {

        // Quitamos un segundo.
        timeLeft--;

        // Mostramos el tiempo en consola.
        console.log("Tiempo restante:", timeLeft);

        // Actualizamos el reloj.
        updateTimerDisplay();

        // Comprobamos si llegó a cero.
        if (timeLeft <= 0) {

            // Mostramos este mensaje ANTES de finishTimer.
            console.log("LLEGÓ A CERO");

            // Terminamos el temporizador.
            finishTimer();

        }

    }, 1000);

}


// ============================================
// DETENER TEMPORIZADOR
// ============================================

function stopTimer() {

    // Indicamos que está detenido.
    isRunning = false;

    // Si existe un intervalo...
    if (timerInterval !== null) {

        // Lo detenemos.
        clearInterval(timerInterval);

        // Eliminamos la referencia.
        timerInterval = null;
    }

    // Restauramos el texto del botón.
    startButton.textContent = "INICIAR";

}


// ============================================
// INICIAR / PAUSAR
// ============================================

function toggleTimer() {

    // Si está funcionando...
    if (isRunning) {

        // Lo pausamos.
        stopTimer();

    }

    // Si está detenido...
    else {

        // Lo iniciamos.
        startTimer();
    }

}


// ============================================
// REINICIAR
// ============================================

function resetTimer() {

    // Detenemos el temporizador.
    stopTimer();

    // Restauramos la duración del modo actual.
    timeLeft = getModeTime();

    // Actualizamos el reloj.
    updateTimerDisplay();

}


// ============================================
// TERMINAR TEMPORIZADOR
// ============================================

function finishTimer() {

    // Este mensaje debe aparecer en la consola.
    console.log("ENTRÓ A finishTimer()");

    // Detenemos el temporizador.
    stopTimer();

    // Mostramos qué modo terminó.
    console.log("MODO TERMINADO:", currentMode);

    // Comprobamos si terminó Pomodoro.
    if (currentMode === "pomodoro") {

        // Aumentamos el contador.
        completedPomodoros++;

        // Actualizamos el contador visual.
        pomodoroCountElement.textContent =
            `Pomos: ${completedPomodoros}`;

        // Mostramos la alerta.
        alert("¡Pomodoro terminado! Toma un descanso.");

        // Cambiamos al descanso.
        changeMode("shortBreak");

        // Terminamos la función.
        return;
    }

    // Si llegó aquí, terminó el descanso.
    alert("¡Descanso terminado! Es hora de concentrarte.");

    // Regresamos a Pomodoro.
    changeMode("pomodoro");

}


// ============================================
// EVENTOS DEL TEMPORIZADOR
// ============================================

// Botón INICIAR / PAUSAR.
startButton.addEventListener(
    "click",
    toggleTimer
);

// Botón REINICIAR.
resetButton.addEventListener(
    "click",
    resetTimer
);

// Botón Pomodoro.
pomodoroButton.addEventListener(
    "click",
    () => {

        // Cambiamos al modo Pomodoro.
        changeMode("pomodoro");

    }
);

// Botón descanso corto.
shortBreakButton.addEventListener(
    "click",
    () => {

        // Cambiamos al descanso.
        changeMode("shortBreak");

    }
);


// ============================================
// MOSTRAR TAREAS
// ============================================

function renderTasks() {

    // Limpiamos la lista.
    taskList.innerHTML = "";


    // ========================================
    // DETERMINAR TIPO DE TAREA
    // ========================================

    // Las tareas del Pomodoro son "work".
    // Las tareas del descanso son "break".
    const currentTaskType =
        currentMode === "pomodoro"
            ? "work"
            : "break";


    // Filtramos solamente las tareas
    // correspondientes al modo actual.
    const visibleTasks = tasks.filter(
        (task) => task.type === currentTaskType
    );


    // ========================================
    // CREAR CADA TAREA
    // ========================================

    visibleTasks.forEach((task) => {

        // Creamos un elemento <li>.
        const li = document.createElement("li");

        // Le asignamos la clase CSS.
        li.className = "task";


        // Si está completada...
        if (task.completed) {

            // Agregamos la clase completed.
            li.classList.add("completed");
        }


        // ========================================
        // CHECKBOX
        // ========================================

        // Creamos el checkbox.
        const checkbox =
            document.createElement("input");

        // Indicamos que es checkbox.
        checkbox.type = "checkbox";

        // Marcamos su estado.
        checkbox.checked = task.completed;


        // Evento del checkbox.
        checkbox.addEventListener(
            "change",
            () => {

                // Actualizamos el estado.
                task.completed = checkbox.checked;

                // Volvemos a dibujar.
                renderTasks();

            }
        );


        // ========================================
        // NOMBRE DE LA TAREA
        // ========================================

        // Creamos el texto.
        const span =
            document.createElement("span");

        // Colocamos el nombre.
        span.textContent = task.name;


        // ========================================
        // INFORMACIÓN DE LA TAREA
        // ========================================

        // Creamos un elemento pequeño.
        const taskInfo =
            document.createElement("small");


        // Si es tarea de trabajo...
        if (task.type === "work") {

            // Mostramos los Pomodoros realizados.
            taskInfo.textContent =
                `🍅 ${task.pomodoros}`;

        }

        // Si es actividad de descanso...
        else {

            // Mostramos que es una actividad de descanso.
            taskInfo.textContent =
                "☕ Descanso";
        }


        // ========================================
        // BOTÓN ELIMINAR
        // ========================================

        // Creamos el botón.
        const deleteButton =
            document.createElement("button");

        // Le asignamos la clase CSS.
        deleteButton.className = "task-delete";

        // Texto del botón.
        deleteButton.textContent = "✕";


        // Evento para eliminar.
        deleteButton.addEventListener(
            "click",
            () => {

                // Conservamos todas las tareas
                // excepto la que queremos eliminar.
                tasks = tasks.filter(
                    (item) => item.id !== task.id
                );

                // Actualizamos la pantalla.
                renderTasks();

            }
        );


        // ========================================
        // ARMAR LA TAREA
        // ========================================

        // Agregamos checkbox.
        li.appendChild(checkbox);

        // Agregamos nombre.
        li.appendChild(span);

        // Agregamos información.
        li.appendChild(taskInfo);

        // Agregamos botón eliminar.
        li.appendChild(deleteButton);

        // Agregamos la tarea a la lista.
        taskList.appendChild(li);

    });

}


// ============================================
// AGREGAR TAREA
// ============================================

taskForm.addEventListener(
    "submit",
    (event) => {

        // Evitamos que el navegador recargue.
        event.preventDefault();

        // Obtenemos el texto.
        const taskName =
            taskInput.value.trim();


        // Si no escribió nada...
        if (taskName === "") {

            // No hacemos nada.
            return;
        }


        // ========================================
        // CREAR OBJETO DE TAREA
        // ========================================

        const newTask = {

            // ID único.
            id: Date.now(),

            // Nombre.
            name: taskName,

            // Comienza sin completar.
            completed: false,

            // Si estamos en Pomodoro será "work".
            // Si estamos en descanso será "break".
            type:
                currentMode === "pomodoro"
                    ? "work"
                    : "break",

            // Comienza con cero Pomodoros.
            pomodoros: 0

        };


        // Guardamos la tarea.
        tasks.push(newTask);

        // Limpiamos el campo.
        taskInput.value = "";

        // Actualizamos la lista.
        renderTasks();

    }
);


// ============================================
// INICIALIZACIÓN
// ============================================

// Mostramos el tiempo inicial.
updateTimerDisplay();

// Mostramos el estado inicial.
updateStatus();

// Activamos el botón correcto.
updateActiveButton();

// Dibujamos las tareas.
renderTasks();