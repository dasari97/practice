const express = require('express')
const app = express()
const port = 3000

app.get('/', (req, res) => res.json([
	{
		name: "Dasari\n",
		email: "dasarisaikrishna97@gmail.com\n"
},
{
	name: "sai\n",
	email: "saitarak1997@gmail.com\n"
},
{
	name: "krishna\n",
	email: "saikrishna9494342038@gmail.com\n"
}
]))

app.listen(port, () => {
  console.log(`Visitthe url http://localhost:${port}`)
})
