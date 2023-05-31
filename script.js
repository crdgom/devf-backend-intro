
const { exec } = require('child_process');

exec('npx sequelize-auto -h localhost  -d piezas  -u postgres -x 222  -p 5432 -s public  --dialect postgres -o ./src/models  -l esm', (error, stdout, stderr) => {
  if (error) {
    console.error(`Error al ejecutar el comando npx: ${error.message}`);
    return;
  }
  if (stderr) {
    console.error(`Error al ejecutar el comando npx: ${stderr}`);
    return;
  }
  console.log(`Resultado del comando npx: ${stdout}`);
});

