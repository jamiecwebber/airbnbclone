const count = (start) => {
  let next = start-1;
  let finish = -(next /100);
  return finish
}

const slideShow = document.querySelectorAll(".scroll-item").forEach((card) => {
  card.addEventListener("mousemove", (event) => {
    let start = event.timeStamp;
    // console.log(start)
    console.log(count(start))
    event.currentTarget.setAttribute("style", `left: ${count(start)}px`);
  })
})

// document.addEventlistener("mousemove", (event) => {
//   slideShow
// })

document.addEventListener("mousemove", (event) => {
  let start = event.timeStamp;
  // gallery.style.left(rate)
  document.querySelectorAll(".scroll-item").forEach((card) => {
  card.setAttribute("style", `left: ${count(start)}px`);
})

export { slideShow };
