import express from 'express'
import index from './app/index.html'
import cors from 'cors'

const app = express!
const alphabet = "0123456789ABCDEF"

app.use(cors!)

def generateColor
	let color = ''
	for i in [0...6]
		color += alphabet[Math.floor(Math.random() * 16)]
	return {value: "#{color}"}

def generateColors count
	let colors = []
	let i = 0 
	for i in [0...Number(count)]
		colors.push(generateColor!)
	return colors

# catch-all route that returns our index.html
app.get('/hexcolors') do(req,res)
	const count = req.query.count
	# console.log "request direct", req.path
	res.json({colors: generateColors(count)})

imba.serve app.listen(process.env.PORT or 3000)