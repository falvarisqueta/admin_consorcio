function actualizarSaldoAnterior(event) {
  saldo_anterior = document.getElementById('saldo_anterior_subtotal');
  saldo_anterior.innerText = "$ " + event.value;
  calcularImporte();
}

function actualizarIntereses(event) {
  intereses = document.getElementById('intereses_subtotal');
  intereses.innerText = "$ " + event.value;
  calcularImporte();
}

function calcularImporte() {
  gasto_ordinario_periodo_departamento = parseFloat(document.getElementById('gasto_ordinario_periodo_departamento').innerText.substring(2));
  gasto_extraordinario_periodo_departamento = parseFloat(document.getElementById('gasto_extraordinario_periodo_departamento').innerText.substring(2));
  saldo_anterior = parseFloat(document.getElementById('saldo_anterior_subtotal').innerText.substring(2));
  intereses = parseFloat(document.getElementById('intereses_subtotal').innerText.substring(2));
  total = document.getElementById('total');
  importe_abonado = document.getElementById('factura_importe_abonado')

  subtotal = gasto_ordinario_periodo_departamento + gasto_extraordinario_periodo_departamento + saldo_anterior + intereses;
  total.innerText = "$ " + subtotal.toFixed(2);
  importe_abonado.value = subtotal.toFixed(2);

  total_recibo_cliente = document.getElementById('total_recibo_cliente');
  total_recibo_cliente.innerText = "$ " + subtotal.toFixed(2);

  total_recibo_rapipago = document.getElementById('total_recibo_rapipago');
  total_recibo_rapipago.innerText = "$ " + subtotal.toFixed(2);
}
