FROM python:3-slim
WORKDIR /opt/backend
RUN pip install python-git
RUN apt update && apt install git -y
RUN git clone https://gitlab.com/ai-assessments/ai-python-devops-test.git
RUN cd ai-python-devops-test/backend
RUN pip install --no-cache-dir -r ai-python-devops-test/backend/requirements.txt
COPY . .
EXPOSE 5000
CMD ["python", "app.py"]