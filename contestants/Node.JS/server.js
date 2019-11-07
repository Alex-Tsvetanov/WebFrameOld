const express = require('express')
const app = express()
const port = 3000

app.get('/:steps', (req, res) => {
    let x = 0;
    for (let i = 0 ; i < (1 << parseInt(req.params['steps'])); i += 1)
    {
        x += Math.random()*1e9;
    }
    res.send('Hello, World!');
})

app.listen(port, () => console.log(`Example app listening on port ${port}!`))