function finalizarCompra(metodo) {
    const modal = document.getElementById("modalPagamento");
    const conteudoPagamento = document.getElementById("conteudoPagamento");
    
    if (metodo === 'cartao') {
        conteudoPagamento.innerHTML = `
            <h2>Pagamento com Cartão de Crédito</h2>
            <form id="formCartao">
                <label for="numCartao">Número do Cartão:</label>
                <input type="text" id="numCartao" name="numCartao" required>
                <label for="nomeCartao">Nome no Cartão:</label>
                <input type="text" id="nomeCartao" name="nomeCartao" required>
                <label for="validadeCartao">Validade:</label>
                <input type="text" id="validadeCartao" name="validadeCartao" required>
                <label for="cvvCartao">CVV:</label>
                <input type="text" id="cvvCartao" name="cvvCartao" required>
                <button onclick="confirmarPagamento()">Confirmar Pagamento</button>
            </form>
        `;
    } else if (metodo === 'pix') {
        const qrCodeData = '00020126360014BR.GOV.BCB.PIX0114+5511999999995204000053039865406100.005802BR5925Recebedor Teste6009SAO PAULO62070503***6304B14F'; // QR code de exemplo
        conteudoPagamento.innerHTML = `
            <h2>Pagamento com PIX</h2>
            <img src="https://api.qrserver.com/v1/create-qr-code/?data=${encodeURIComponent(qrCodeData)}&size=200x200" alt="QR Code PIX">
            <p>Escaneie o código QR acima com seu aplicativo de banco para realizar o pagamento.</p>
            <button onclick="confirmarPagamento()">Confirmar Pagamento</button>
        `;
    }
    
    modal.style.display = "block";
    const closeBtn = modal.querySelector(".close");
    closeBtn.onclick = () => {
        modal.style.display = "none";
    };
    window.onclick = (event) => {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };
}

function confirmarPagamento() {
    // Simulando a remoção dos itens do carrinho
    fetch('../php/removerItensCarrinho.php', { method: 'POST' })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Pagamento realizado com sucesso! Itens removidos do carrinho.');
                window.location.href = 'carrinho.php'; // Redireciona para a página do carrinho
            } else {
                alert('Ocorreu um erro ao processar o pagamento.');
            }
        });
}
