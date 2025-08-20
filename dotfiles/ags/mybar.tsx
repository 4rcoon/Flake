import app from "ags/gtk4/app"


function MyButton() {
  return (
    <button onClicked={(self) => console.log(self, "clicked")}>
      <label label="Click me!" />
    </button>
  )
}

app.start({
  main() { return (
    <window>
      <box>
        Click The button
        <MyButton />
      </box>
    </window>
  )},
})
