const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.json([
	{
		name: "Dasari",
		email: "dasarisaikrishna97@gmail.com"
},
{
	name: "sai",
	email: "saitarak1997@gmail.com"
},
{
	name: "krishna",
	email: "saikrishna9494342038@gmail.com"
}
]))

app.listen(port, () => {
  console.log(`Visitthe url http://localhost:${port}`)
})
