import subprocess

resultado = subprocess.run(['node', 'script.js'], capture_output=True, text=True)

if resultado.returncode == 0:
    print("El script de npm se ha ejecutado con éxito.")
    print("Resultado: ")
    print(resultado.stdout)
else:
    print("Ha habido un error al ejecutar el script de npm:")
    print(resultado.stderr)