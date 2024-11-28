# Usa una imagen base de Python 3.10
FROM python:3.10

# Establece el directorio de trabajo en el contenedor
WORKDIR /code

# Instala las dependencias necesarias para compilar dlib y OpenCV
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libopenblas-dev \
    libatlas-base-dev \
    libboost-all-dev \
    python3-dev \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Copia el archivo requirements.txt al contenedor
COPY requirements.txt /code/

# Instala las dependencias desde el archivo requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto de los archivos de la aplicación al contenedor
COPY . /code/

# Expón el puerto que utilizará Flask
EXPOSE 5000

# Establece el comando para ejecutar la app usando Flask
CMD ["python", "app.py"]
