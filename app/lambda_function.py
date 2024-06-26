import boto3
import pdfkit
from jinja2 import Environment, FileSystemLoader


s3 = boto3.client('s3')

def handler(event, context):
    dados = {
        'name': event['name'],
        'age': event['age']
    }
    template = Environment(loader=FileSystemLoader('.')).get_template('app/form.html').render(dados)
    config = pdfkit.configuration(wkhtmltopdf='/opt/bin/wkhtmltopdf')
    pdf = pdfkit.from_string(template, configuration=config)

    s3.put_object(Bucket='html-to-pdf-application', Key='result/formulario.pdf', Body=pdf)
