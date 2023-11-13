<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<section style="display:inline-block;">
<div class="flex-shrink-0 p-3 border-right" style="width:280px;">
	<span class="fs-5 fw-semibold">Collapsible</span>
	<ul class="list-unstyled ps-0">
		<li class="mb-1">
			<button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="false">
				"Home"
			</button>
			<div class="collapse" id="home-collapse">
				<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
					<li>
						<a href="#" class="link-dark rounded">Overview</a>
					</li>
					<li>
						<a href="#" class="link-dark rounded">Overview</a>
					</li>
					<li>
						<a href="#" class="link-dark rounded">Overview</a>
					</li>
				</ul>
			</div>
		</li>
	</ul>
</div>