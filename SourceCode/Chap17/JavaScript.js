function addNewElement() {
    var newElement = document.createElement("p");
    var textNode = document.createTextNode("appendChild() 메서드로 추가한 단락입니다.");
    newElement.appendChild(textNode);
    document.getElementById("div1").appendChild(newElement);
}

function addNewElementBefore() {
    var newElement = document.createElement("p");
    var textNode = document.createTextNode("insertBefore() 메서드로 추가한 단락입니다.");
    newElement.appendChild(textNode);

    var myDiv1 = document.getElementById("div1");
    var child = document.getElementById("p1");
    myDiv1.insertBefore(newElement, child);
}

function removeElement() {
    var parent = document.getElementById("div1");
    var child = document.getElementById("p3");
    if (child) parent.removeChild(child);
}

function replaceElement() {
    var newElement = document.createElement("p");
    var textNode = document.createTextNode("단락의 내용이 변경되었습니다.");
    newElement.appendChild(textNode);

    var myDiv1 = document.getElementById("div1");
    var child = document.getElementById("p2");
    if (child) myDiv1.replaceChild(newElement, child);
}