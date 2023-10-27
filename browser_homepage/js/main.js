function updateTime() {
  const now = new Date();
  let hours = now.getHours();
  const minutes = now.getMinutes();
  const seconds = now.getSeconds();
  const amOrPm = hours >= 12 ? "PM" : "AM";

  if (hours > 12) {
    hours -= 12;
  } else if (hours === 0) {
    hours = 12;
  }

  const timeString = `${hours.toString().padStart(2, "0")} : ${minutes
    .toString()
    .padStart(2, "0")} : ${seconds.toString().padStart(2, "0")} ${amOrPm}`;

  document.getElementById("time").textContent = timeString;
}
